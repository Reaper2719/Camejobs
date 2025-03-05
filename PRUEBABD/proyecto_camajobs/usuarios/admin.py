from django.contrib import admin
from .models import Persona, Empresa, FormacionAcademica, ExperienciaLaboral
# Register your models here.
@admin.register(Persona)
class PersonaAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'cedula', 'email', 'habilidades')

@admin.register(Empresa)
class EmpresaAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'razon_social', 'nit', 'email')

@admin.register(FormacionAcademica)
class FormacionAcademicaAdmin(admin.ModelAdmin):
    list_display = ('persona', 'nivel_educativo', 'titulo_obtenido', 'institucion')

@admin.register(ExperienciaLaboral)
class ExperienciaLaboralAdmin(admin.ModelAdmin):
    list_display = ('persona', 'nombre_empresa', 'cargo', 'fecha_inicio', 'fecha_fin')