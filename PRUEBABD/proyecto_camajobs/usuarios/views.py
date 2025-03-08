from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login
from .forms import (
    RegistroPersonaForm, RegistroEmpresaForm, 
    CalificacionPersona, CalificacionEmpresa,
    FormacionAcademicaForm, ExperienciaLaboralForm, 
    CalificacionPersonaForm, CalificacionEmpresaForm
)
from .models import Persona, Empresa, FormacionAcademica, ExperienciaLaboral
from django.contrib.auth.decorators import login_required
from usuarios.models import Persona, Empresa
from ofertas.models import Oferta, Postulacion
from django.contrib import messages
from tickets.models import Ticket
from django.db.models import Avg, Count
from django.views import View
from django.contrib.auth.views import LoginView

#neceesario para validación
from django.core.mail import send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.contrib.auth.models import User

# Vista para la página principal
def pagina_principal(request):
    return render(request, 'usuarios/paginaPrincipal.html')

# Vista de inicio de sesión personalizada
class CustomLoginView(LoginView):
    template_name = 'usuarios/login.html'  # Cambia esto al template de inicio de sesión

# Vista de inicio (opcional)
def inicio(request):
    return render(request, 'usuarios/inicio.html')

# Registro de persona
def registro_persona(request):
    if request.method == 'POST':
        form = RegistroPersonaForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save()
            Persona.objects.create(
                usuario=user,
                cedula=form.cleaned_data['cedula'],
                nombre_completo=form.cleaned_data['nombre_completo'],
                telefono=form.cleaned_data['telefono'],
                direccion=form.cleaned_data['direccion'],
                fecha_nacimiento=form.cleaned_data['fecha_nacimiento'],
                genero=form.cleaned_data['genero'],
                habilidades=form.cleaned_data['habilidades'],
                email=form.cleaned_data['email'],
                ubicacion=form.cleaned_data['ubicacion'],
                foto_perfil=form.cleaned_data['foto_perfil']
            )
            # Generar enlace de confirmación
            token = default_token_generator.make_token(user)
            uid = urlsafe_base64_encode(force_bytes(user.pk))
            
            confirm_link = f"{request.scheme}://{request.get_host()}/usuarios/confirmar-email/{uid}/{token}/"
            

            # Enviar correo
            send_mail(
                'Confirma tu correo electrónico',
                f'Haz clic aquí para confirmar tu cuenta: {confirm_link}',
                'no-reply@camajobs.com',
                [user.email],
                fail_silently=False,
            )
            return redirect('confirmacion-enviada')
    else:
        form = RegistroPersonaForm()
    return render(request, 'usuarios/registro_persona.html', {'form': form})

# Registro de empresa
def registro_empresa(request):
    if request.method == 'POST':
        form = RegistroEmpresaForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save()
            Empresa.objects.create(
                usuario=user,
                nit=form.cleaned_data['nit'],
                razon_social=form.cleaned_data['razon_social'],
                telefono=form.cleaned_data['telefono'],
                direccion=form.cleaned_data['direccion'],
                sitio_web=form.cleaned_data['sitio_web'],
                descripcion=form.cleaned_data['descripcion'],
                email=form.cleaned_data['email'],
                ubicacion=form.cleaned_data['ubicacion'],
                logo=form.cleaned_data['logo']
            )
            # Generar enlace de confirmación (mismo código que en registro_persona)
            token = default_token_generator.make_token(user)
            uid = urlsafe_base64_encode(force_bytes(user.pk))
            current_site = get_current_site(request).domain
            confirm_link = f"{request.scheme}://{request.get_host()}/usuarios/confirmar-email/{uid}/{token}/"

            # Enviar correo
            send_mail(
                'Confirma tu correo electrónico',
                f'Haz clic aquí para confirmar tu cuenta: {confirm_link}',
                'no-reply@camajobs.com',
                [user.email],
                fail_silently=False,
            )
            return redirect('confirmacion-enviada')
    else:
        form = RegistroEmpresaForm()
    return render(request, 'usuarios/registro_empresa.html', {'form': form})

# Vista de bienvenida
@login_required
def bienvenida(request):
    usuario = request.user
    ofertas_activas = Oferta.objects.filter(activa=True)
    context = {
        'usuario': usuario,
        'ofertas': ofertas_activas,
    }

    if hasattr(usuario, 'persona'):
        context['tipo'] = 'persona'
        context['nombre'] = usuario.persona.nombre_completo
        postulaciones = Postulacion.objects.filter(trabajador=usuario.persona)
        context['postulaciones'] = postulaciones
        context['empresas_calificadas'] = Empresa.objects.filter(
            calificaciones_recibidas__persona=usuario.persona
        ).annotate(
            promedio_calificaciones=Avg('calificaciones_recibidas__puntuacion'),
            cantidad_calificaciones=Count('calificaciones_recibidas')
        ).distinct()

    elif hasattr(usuario, 'empresa'):
        context['tipo'] = 'empresa'
        context['nombre'] = usuario.empresa.razon_social
        ofertas_empresa = Oferta.objects.filter(empresa=usuario.empresa, activa=True)
        context['ofertas_empresa'] = ofertas_empresa
        context['personas_calificadas'] = Persona.objects.filter(
            calificaciones_recibidas__empresa=usuario.empresa
        ).annotate(
            promedio_calificaciones=Avg('calificaciones_recibidas__puntuacion'),
            cantidad_calificaciones=Count('calificaciones_recibidas')
        ).distinct()

    return render(request, 'usuarios/bienvenida.html', context)

# Perfil de persona
@login_required
def perfil_persona(request):
    persona = get_object_or_404(Persona, usuario=request.user)
    formaciones = FormacionAcademica.objects.filter(persona=persona)
    experiencias = ExperienciaLaboral.objects.filter(persona=persona)
    tickets = Ticket.objects.filter(usuario=request.user)

    return render(request, 'usuarios/perfil_persona.html', {
        'persona': persona,
        'formaciones': formaciones,
        'experiencias': experiencias,
        'tickets': tickets,
    })

# Perfil de empresa
@login_required
def perfil_empresa(request, empresa_id=None):
    if empresa_id:
        empresa = get_object_or_404(Empresa, id=empresa_id)
    else:
        empresa = get_object_or_404(Empresa, usuario=request.user)

    tickets = Ticket.objects.filter(usuario=request.user)

    return render(request, 'usuarios/perfil_empresa.html', {
        'empresa': empresa,
        'tickets': tickets,
    })

# Funciones adicionales para la formación y experiencia académica
@login_required
def agregar_formacion(request):
    persona = get_object_or_404(Persona, usuario=request.user)
    if request.method == 'POST':
        form = FormacionAcademicaForm(request.POST)
        if form.is_valid():
            formacion = form.save(commit=False)
            formacion.persona = persona
            formacion.save()
            messages.success(request, 'Formación académica agregada correctamente.')
            return redirect('perfil_persona')
    else:
        form = FormacionAcademicaForm()

    return render(request, 'usuarios/agregar_formacion.html', {'form': form})

@login_required
def editar_formacion(request, formacion_id):
    formacion = get_object_or_404(FormacionAcademica, id=formacion_id, persona__usuario=request.user)
    if request.method == 'POST':
        form = FormacionAcademicaForm(request.POST, instance=formacion)
        if form.is_valid():
            form.save()
            messages.success(request, 'Formación académica actualizada correctamente.')
            return redirect('perfil_persona')
    else:
        form = FormacionAcademicaForm(instance=formacion)

    return render(request, 'usuarios/editar_formacion.html', {'form': form})

@login_required
def eliminar_formacion(request, formacion_id):
    formacion = get_object_or_404(FormacionAcademica, id=formacion_id, persona__usuario=request.user)
    formacion.delete()
    messages.success(request, 'Formación académica eliminada correctamente.')
    return redirect('perfil_persona')

# Vistas para la experiencia laboral
@login_required
def agregar_experiencia(request):
    persona = get_object_or_404(Persona, usuario=request.user)
    if request.method == 'POST':
        form = ExperienciaLaboralForm(request.POST)
        if form.is_valid():
            experiencia = form.save(commit=False)
            experiencia.persona = persona
            experiencia.save()
            messages.success(request, 'Experiencia laboral agregada correctamente.')
            return redirect('perfil_persona')
    else:
        form = ExperienciaLaboralForm()

    return render(request, 'usuarios/agregar_experiencia.html', {'form': form})

@login_required
def editar_experiencia(request, experiencia_id):
    experiencia = get_object_or_404(ExperienciaLaboral, id=experiencia_id, persona__usuario=request.user)
    if request.method == 'POST':
        form = ExperienciaLaboralForm(request.POST, instance=experiencia)
        if form.is_valid():
            form.save()
            messages.success(request, 'Experiencia laboral actualizada correctamente.')
            return redirect('perfil_persona')
    else:
        form = ExperienciaLaboralForm(instance=experiencia)

    return render(request, 'usuarios/editar_experiencia.html', {'form': form})

@login_required
def eliminar_experiencia(request, experiencia_id):
    experiencia = get_object_or_404(ExperienciaLaboral, id=experiencia_id, persona__usuario=request.user)
    experiencia.delete()
    messages.success(request, 'Experiencia laboral eliminada correctamente.')
    return redirect('perfil_persona')

# Vistas de calificación
@login_required
def calificar_persona(request, persona_id):
    persona = get_object_or_404(Persona, id=persona_id)
    empresa = get_object_or_404(Empresa, usuario=request.user)

    if request.method == 'POST':
        form = CalificacionPersonaForm(request.POST)
        if form.is_valid():
            calificacion = form.save(commit=False)
            calificacion.empresa = empresa
            calificacion.persona = persona
            calificacion.save()
            messages.success(request, 'Calificación enviada exitosamente.')
            return redirect('perfil_persona', persona_id=persona.id)
    else:
        form = CalificacionPersonaForm()

    return render(request, 'usuarios/calificar_persona.html', {'form': form, 'persona': persona})

@login_required
def calificar_empresa(request, empresa_id):
    empresa = get_object_or_404(Empresa, id=empresa_id)
    persona = get_object_or_404(Persona, usuario=request.user)

    if request.method == 'POST':
        form = CalificacionEmpresaForm(request.POST)
        if form.is_valid():
            calificacion = form.save(commit=False)
            calificacion.persona = persona
            calificacion.empresa = empresa
            calificacion.save()
            messages.success(request, 'Calificación enviada exitosamente.')
            return redirect('perfil_empresa', empresa_id=empresa.id)
    else:
        form = CalificacionEmpresaForm()

    return render(request, 'usuarios/calificar_empresa.html', {'form': form, 'empresa': empresa})

#Pagina ofertas
def pagina_ofertas(request):
    return render(request, 'usuarios/pagina_ofertas.html')

#Preguntas frecuentes
@login_required
def faqs_pagina(request):
    return render(request, 'usuarios/faqs_pagina.html')

#Pagina de perfiles
@login_required
def busquedas_pagina(request):
    return render(request, 'usuarios/busquedas_pagina.html')

#confirmar correo
from django.utils.http import urlsafe_base64_decode
from django.contrib.auth import login

def confirmar_email(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user)
        return redirect('bienvenida')
    else:
        return render(request, 'usuarios/enlace_invalido.html')
    
def confirmacion_enviada(request):
    return render(request, 'usuarios/confirmacion_enviada.html')