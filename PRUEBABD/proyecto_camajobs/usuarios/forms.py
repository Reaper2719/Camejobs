from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Persona, Empresa, FormacionAcademica, ExperienciaLaboral, CalificacionPersona, CalificacionEmpresa
#VALIDACION
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
from django.core.exceptions import ValidationError
from django.contrib.auth import authenticate
from django.utils.translation import gettext_lazy as _

class RegistroPersonaForm(UserCreationForm):
    cedula = forms.CharField(max_length=15, label="Cédula")
    nombre_completo = forms.CharField(max_length=100, label="Nombre Completo")
    telefono = forms.CharField(max_length=15, label="Teléfono")
    profesion = forms.CharField(max_length=100, label="Profesión")
    direccion = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Ej: Calle 123 #45-67'}), label="Dirección")
    fecha_nacimiento = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}), label="Fecha de Nacimiento")
    genero = forms.ChoiceField(choices=[('M', 'Masculino'), ('F', 'Femenino'), ('O', 'Otro')], label="Género")
    habilidades = forms.CharField(widget=forms.Textarea, label="Habilidades")
    email = forms.EmailField(label="Correo Electrónico")
    ubicacion = forms.CharField(max_length=100, label="Ubicación")
    foto_perfil = forms.ImageField(required=False, label="Foto de Perfil")

    def save(self, commit=True):
        # Validar el formulario antes de guardar
        if not self.is_valid():
            raise ValidationError("El formulario no es válido.")
        
        user = super().save(commit=False)
        user.email = self.cleaned_data['email']  # Sincroniza el email con el User
        user.is_active = False  # Usuario inactivo hasta confirmar correo
        
        if commit:
            user.save() # Guardar el User
            # Crear el perfil Persona
            Persona.objects.create(
                usuario=user,
                cedula=self.cleaned_data['cedula'],
                nombre_completo=self.cleaned_data['nombre_completo'],
                telefono=self.cleaned_data['telefono'],
                profesion=self.cleaned_data['profesion'],
                direccion=self.cleaned_data['direccion'],
                fecha_nacimiento=self.cleaned_data['fecha_nacimiento'],
                genero=self.cleaned_data['genero'],
                habilidades=self.cleaned_data['habilidades'],
                email=self.cleaned_data['email'],
                ubicacion=self.cleaned_data['ubicacion'],
                foto_perfil=self.cleaned_data['foto_perfil']
            )
        return user

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2', 'cedula', 'nombre_completo', 'telefono', 'profesion', 'direccion', 'fecha_nacimiento', 'genero', 'habilidades', 'email', 'ubicacion','foto_perfil']

class RegistroEmpresaForm(UserCreationForm):
    nit = forms.CharField(max_length=20, label="NIT")
    razon_social = forms.CharField(max_length=100, label="Razón Social")
    telefono = forms.CharField(max_length=15, label="Teléfono")
    eslogan = forms.CharField(max_length=200, label="Eslogan", required=False)
    direccion = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Ej: Avenida Principal #100-23'}), label="Dirección")
    sitio_web = forms.URLField(required=False, label="Sitio Web")
    descripcion = forms.CharField(widget=forms.Textarea, label="Descripción")
    email = forms.EmailField(label="Correo Electrónico")
    ubicacion = forms.CharField(max_length=100, label="Ubicación")
    logo = forms.ImageField(required=False, label="Logo")
    
    def save(self, commit=True):
        
        # Validar el formulario antes de guardar
        if not self.is_valid():
            raise ValidationError("El formulario no es válido.")

        user = super().save(commit=False)
        user.email = self.cleaned_data['email']  # Sincroniza el email con el User
        user.is_active = False  # Usuario inactivo hasta confirmar correo
        
        if commit:
            user.save() # Guardar el User
            # Crear el perfil Empresa
            Empresa.objects.create(
                usuario=user,
                nit=self.cleaned_data['nit'],
                razon_social=self.cleaned_data['razon_social'],
                telefono=self.cleaned_data['telefono'],
                eslogan=self.cleaned_data['eslogan'],
                direccion=self.cleaned_data['direccion'],
                sitio_web=self.cleaned_data['sitio_web'],
                descripcion=self.cleaned_data['descripcion'],
                email=self.cleaned_data['email'],
                ubicacion=self.cleaned_data['ubicacion'],
                logo=self.cleaned_data['logo']
            ) 
        return user

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2', 'nit', 'razon_social', 'telefono', 'eslogan', 'direccion', 'sitio_web', 'descripcion', 'email', 'ubicacion', 'logo']
        

class FormacionAcademicaForm(forms.ModelForm):
    class Meta:
        model = FormacionAcademica
        fields = ['nivel_educativo', 'institucion', 'titulo_obtenido', 'fecha_inicio', 'fecha_fin', 'en_progreso']
        widgets = {
            'fecha_inicio': forms.DateInput(attrs={'type': 'date'}),
            'fecha_fin': forms.DateInput(attrs={'type': 'date'}),
        }

class ExperienciaLaboralForm(forms.ModelForm):
    class Meta:
        model = ExperienciaLaboral
        fields = ['nombre_empresa', 'cargo', 'fecha_inicio', 'fecha_fin', 'descripcion', 'en_progreso']
        widgets = {
            'fecha_inicio': forms.DateInput(attrs={'type': 'date'}),
            'fecha_fin': forms.DateInput(attrs={'type': 'date'}),
        }
  
class CalificacionPersonaForm(forms.ModelForm):
    class Meta:
        model = CalificacionPersona
        fields = ['puntuacion', 'comentario']
        widgets = {
            'puntuacion': forms.NumberInput(attrs={'min': 1, 'max': 5}),
            'comentario': forms.Textarea(attrs={'rows': 4}),
        }

class CalificacionEmpresaForm(forms.ModelForm):
    class Meta:
        model = CalificacionEmpresa
        fields = ['puntuacion', 'comentario']
        widgets = {
            'puntuacion': forms.NumberInput(attrs={'min': 1, 'max': 5}),
            'comentario': forms.Textarea(attrs={'rows': 4}),
        }

class CustomAuthenticationForm(AuthenticationForm):
    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username is not None and password:
            self.user_cache = authenticate(
                self.request,
                username=username,
                password=password
            )
            
            # Verifica si el usuario existe pero no está activo
            if self.user_cache is None:
                try:
                    user_temp = User.objects.get(username=username)
                    if not user_temp.is_active:
                        raise ValidationError(
                            _("¡Cuenta no verificada! Revisa tu correo para activarla."),
                            code='inactive_account',
                        )
                except User.DoesNotExist:
                    pass
                
                raise self.get_invalid_login_error()
            
            self.confirm_login_allowed(self.user_cache)

        return self.cleaned_data           
    
class PersonaForm(forms.ModelForm):
    class Meta:
        model = Persona
        fields = [
            'nombre_completo', 'cedula', 'profesion', 'telefono', 'direccion',
            'fecha_nacimiento', 'genero', 'email', 'ubicacion',
            'habilidades', 'perfil_laboral', 'foto_perfil'
        ]
        widgets = {
            'fecha_nacimiento': forms.DateInput(attrs={'type': 'date'}),
        }