from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Persona, Empresa, FormacionAcademica, ExperienciaLaboral, CalificacionPersona, CalificacionEmpresa


class RegistroPersonaForm(UserCreationForm):
    cedula = forms.CharField(max_length=15, label="Cédula")
    nombre_completo = forms.CharField(max_length=100, label="Nombre Completo")
    telefono = forms.CharField(max_length=15, label="Teléfono")
    direccion = forms.CharField(widget=forms.Textarea, label="Dirección")
    fecha_nacimiento = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}), label="Fecha de Nacimiento")
    genero = forms.ChoiceField(choices=[('M', 'Masculino'), ('F', 'Femenino'), ('O', 'Otro')], label="Género")
    habilidades = forms.CharField(widget=forms.Textarea, label="Habilidades")
    email = forms.EmailField(label="Correo Electrónico")
    ubicacion = forms.CharField(max_length=100, label="Ubicación")
    foto_perfil = forms.ImageField(required=False, label="Foto de Perfil")

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2', 'cedula', 'nombre_completo', 'telefono', 'direccion', 'fecha_nacimiento', 'genero', 'habilidades', 'email', 'ubicacion','foto_perfil']

class RegistroEmpresaForm(UserCreationForm):
    nit = forms.CharField(max_length=20, label="NIT")
    razon_social = forms.CharField(max_length=100, label="Razón Social")
    telefono = forms.CharField(max_length=15, label="Teléfono")
    direccion = forms.CharField(widget=forms.Textarea, label="Dirección")
    sitio_web = forms.URLField(required=False, label="Sitio Web")
    descripcion = forms.CharField(widget=forms.Textarea, label="Descripción")
    email = forms.EmailField(label="Correo Electrónico")
    ubicacion = forms.CharField(max_length=100, label="Ubicación")
    logo = forms.ImageField(required=False, label="Logo")

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2', 'nit', 'razon_social', 'telefono', 'direccion', 'sitio_web', 'descripcion', 'email', 'ubicacion', 'logo']
        

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