from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
# Create your models here.

class Persona(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    nombre_completo = models.CharField(max_length=100, verbose_name="Nombre Completo")
    cedula = models.CharField(max_length=15, unique=True, verbose_name="Cédula")
    telefono = models.CharField(max_length=15, verbose_name="Teléfono")
    direccion = models.TextField(verbose_name="Dirección")
    fecha_nacimiento = models.DateField(verbose_name="Fecha de Nacimiento")
    genero = models.CharField(max_length=10, choices=[('M', 'Masculino'), ('F', 'Femenino'), ('O', 'Otro')], verbose_name="Género")
    email = models.EmailField(verbose_name="Correo Electrónico")
    ubicacion = models.CharField(max_length=100, verbose_name="Ubicación")
    habilidades = models.TextField(verbose_name="Habilidades")
    perfil_laboral = models.TextField(verbose_name="Perfil Laboral")
    foto_perfil = models.ImageField(upload_to='fotos_perfil/', null=True, blank=True, verbose_name="Foto de Perfil")

    def __str__(self):
        return f"{self.usuario.username} - {self.cedula}"

class Empresa(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    nit = models.CharField(max_length=20, unique=True, verbose_name="NIT")
    razon_social = models.CharField(max_length=100, verbose_name="Razón Social")
    telefono = models.CharField(max_length=15, verbose_name="Teléfono")
    direccion = models.TextField(verbose_name="Dirección")
    email = models.EmailField(verbose_name="Correo Electrónico")
    sitio_web = models.URLField(blank=True, null=True, verbose_name="Sitio Web")
    descripcion = models.TextField(verbose_name="Descripción")
    ubicacion = models.CharField(max_length=100, verbose_name="Ubicación")
    logo = models.ImageField(upload_to='logos_empresa/', null=True, blank=True, verbose_name="Logo")

    def __str__(self):
        return f"{self.razon_social} - {self.nit}"
    
class FormacionAcademica(models.Model):
    persona = models.ForeignKey(Persona, on_delete=models.CASCADE, verbose_name="Persona")
    nivel_educativo = models.CharField(
        max_length=50,
        choices=[
            ('Bachiller', 'Bachiller'),
            ('Técnico', 'Técnico'),
            ('Tecnólogo', 'Tecnólogo'),
            ('Pregrado', 'Pregrado'),
            ('Posgrado', 'Posgrado'),
            ('Curso', 'Curso'),
            ('Otro', 'Otro'),
        ],
        verbose_name="Nivel Educativo"
    )
    institucion = models.CharField(max_length=100, verbose_name="Institución")
    titulo_obtenido = models.CharField(max_length=100, verbose_name="Título Obtenido")
    fecha_inicio = models.DateField(verbose_name="Fecha de Inicio")
    fecha_fin = models.DateField(verbose_name="Fecha de Fin", null=True, blank=True)  # Puede estar en progreso
    en_progreso = models.BooleanField(default=False, verbose_name="En Progreso")

    def __str__(self):
        return f"{self.persona.usuario.username} - {self.titulo_obtenido} ({self.nivel_educativo})"
    
class ExperienciaLaboral(models.Model):
    persona = models.ForeignKey(Persona, on_delete=models.CASCADE, verbose_name="Persona")
    nombre_empresa = models.CharField(max_length=100, verbose_name="Nombre de la Empresa")
    cargo = models.CharField(max_length=100, verbose_name="Cargo")
    fecha_inicio = models.DateField(verbose_name="Fecha de Inicio")
    fecha_fin = models.DateField(verbose_name="Fecha de Fin", null=True, blank=True)  # Puede estar en progreso
    descripcion = models.TextField(verbose_name="Descripción")
    en_progreso = models.BooleanField(default=False, verbose_name="En Progreso")

    def __str__(self):
        return f"{self.persona.usuario.username} - {self.cargo} en {self.nombre_empresa}"
    

class CalificacionPersona(models.Model):
    empresa = models.ForeignKey('Empresa', on_delete=models.CASCADE, related_name='calificaciones_hechas')
    persona = models.ForeignKey('Persona', on_delete=models.CASCADE, related_name='calificaciones_recibidas')
    puntuacion = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])  # Calificación de 1 a 5
    comentario = models.TextField(blank=True, null=True)  # Opcional: Comentario sobre la calificación
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.empresa.razon_social} -> {self.persona.nombre_completo}: {self.puntuacion} estrellas"

class CalificacionEmpresa(models.Model):
    persona = models.ForeignKey('Persona', on_delete=models.CASCADE, related_name='calificaciones_hechas')
    empresa = models.ForeignKey('Empresa', on_delete=models.CASCADE, related_name='calificaciones_recibidas')
    puntuacion = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])  # Calificación de 1 a 5
    comentario = models.TextField(blank=True, null=True)  # Opcional: Comentario sobre la calificación
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.persona.nombre_completo} -> {self.empresa.razon_social}: {self.puntuacion} estrellas"    