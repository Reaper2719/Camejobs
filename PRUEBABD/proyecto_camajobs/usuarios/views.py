from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login
from .forms import RegistroPersonaForm, RegistroEmpresaForm, CalificacionPersona, CalificacionEmpresa
from .models import Persona, Empresa, FormacionAcademica, ExperienciaLaboral
from django.contrib.auth.decorators import login_required
from usuarios.models import Persona, Empresa
from ofertas.models import Oferta, Postulacion  # Importa el modelo de ofertas
from django.contrib import messages
from .forms import RegistroPersonaForm, RegistroEmpresaForm, FormacionAcademicaForm, ExperienciaLaboralForm, CalificacionPersonaForm, CalificacionEmpresaForm
from tickets.models import Ticket  # Importar el modelo Ticket
from django.db.models import Avg, Count

def registro_persona(request):
    if request.method == 'POST':
        form = RegistroPersonaForm(request.POST, request.FILES)  # Aceptar archivos (foto de perfil)
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
                foto_perfil=form.cleaned_data['foto_perfil']  # Guardar la foto de perfil
            )
            login(request, user)
            return redirect('bienvenida')  # Redirige a la página de bienvenida
    else:
        form = RegistroPersonaForm()
    return render(request, 'usuarios/registro_persona.html', {'form': form})

def registro_empresa(request):
    if request.method == 'POST':
        form = RegistroEmpresaForm(request.POST, request.FILES)  # Aceptar archivos
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
                logo=form.cleaned_data['logo']  # Guardar el logo
            )
            login(request, user)
            return redirect('bienvenida')  # Redirige a la página de bienvenida 
    else:
        form = RegistroEmpresaForm()
    return render(request, 'usuarios/registro_empresa.html', {'form': form})

def inicio(request):
    return render(request, 'usuarios/inicio.html')

@login_required
def bienvenida(request):
    
    # Limpiar mensajes después de mostrarlos
    storage = messages.get_messages(request)
    for message in storage:
        pass  # Esto asegura que los mensajes se marquen como usados
    usuario = request.user
    ofertas_activas = Oferta.objects.filter(activa=True)  # Obtener ofertas activas
    context = {
        'usuario': usuario,
        'ofertas': ofertas_activas, # Añadir ofertas al contexto
        
    }

    # Verificar si el usuario es una persona o una empresa
    if hasattr(usuario, 'persona'):
        context['tipo'] = 'persona'
        context['nombre'] = usuario.persona.nombre_completo
        # Obtener las postulaciones de la persona
        postulaciones = Postulacion.objects.filter(trabajador=usuario.persona)
        context['postulaciones'] = postulaciones  # Añadir postulaciones al contexto
        context['empresas_calificadas'] = Empresa.objects.filter(
            calificaciones_recibidas__persona=usuario.persona
        ).annotate(
            promedio_calificaciones=Avg('calificaciones_recibidas__puntuacion'),
            cantidad_calificaciones=Count('calificaciones_recibidas')
        ).distinct()
    elif hasattr(usuario, 'empresa'):
        context['tipo'] = 'empresa'
        context['nombre'] = usuario.empresa.razon_social
        # Obtener las ofertas de la empresa actual
        ofertas_empresa = Oferta.objects.filter(empresa=usuario.empresa, activa=True)
        context['ofertas_empresa'] = ofertas_empresa  # Añadir ofertas de la empresa al contexto
        context['personas_calificadas'] = Persona.objects.filter(
            calificaciones_recibidas__empresa=usuario.empresa
        ).annotate(
            promedio_calificaciones=Avg('calificaciones_recibidas__puntuacion'),
            cantidad_calificaciones=Count('calificaciones_recibidas')
        ).distinct()

    return render(request, 'usuarios/bienvenida.html', context)

def custom_login(request):
    return render(request, 'usuarios/login.html', {'request': request})

# Nueva vista para el perfil de la persona
@login_required
def perfil_persona(request):
    persona = get_object_or_404(Persona, usuario=request.user)
    formaciones = FormacionAcademica.objects.filter(persona=persona)
    experiencias = ExperienciaLaboral.objects.filter(persona=persona)
    tickets = Ticket.objects.filter(usuario=request.user)  # Tickets de la persona
    
    return render(request, 'usuarios/perfil_persona.html', {
        'persona': persona,
        'formaciones': formaciones,
        'experiencias': experiencias,
        
    })
    
@login_required
def perfil_empresa(request, empresa_id=None):
    # Si no se proporciona empresa_id, usar la empresa del usuario actual
    if empresa_id:
        empresa = get_object_or_404(Empresa, id=empresa_id)
    else:
        empresa = get_object_or_404(Empresa, usuario=request.user)
    
    tickets = Ticket.objects.filter(usuario=request.user)  # Tickets de la empresa

    return render(request, 'usuarios/perfil_empresa.html', {
        'empresa': empresa,
        'tickets': tickets,  # Pasar los tickets al template
    })   

    
# Vistas para la formación académica
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

#Editar formacion de persona 
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

#Eliminar informacion de formacion de persona
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

#Editar exp laboral de persona 
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

#Eliminar informacion de exp laboral de persona
@login_required
def eliminar_experiencia(request, experiencia_id):
    experiencia = get_object_or_404(ExperienciaLaboral, id=experiencia_id, persona__usuario=request.user)
    experiencia.delete()
    messages.success(request, 'Experiencia laboral eliminada correctamente.')
    return redirect('perfil_persona')

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