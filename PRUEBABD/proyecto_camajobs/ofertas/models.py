from django.db import models
from usuarios.models import Empresa
from usuarios.models import Persona
from django.contrib.auth.models import User
# Create your models here.

class Oferta(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, verbose_name="Empresa")
    titulo = models.CharField(max_length=100, verbose_name="Título")
    descripcion = models.TextField(verbose_name="Descripción")
    salario = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Salario")
    fecha_publicacion = models.DateField(auto_now_add=True, verbose_name="Fecha de Publicación")
    fecha_cierre = models.DateField(verbose_name="Fecha de Cierre")
    ubicacion = models.CharField(max_length=100, verbose_name="Ubicación")
    activa = models.BooleanField(default=True, verbose_name="Activa")

    def __str__(self):
        return f"{self.titulo} - {self.empresa.razon_social}"
    
class Postulacion(models.Model):
    oferta = models.ForeignKey(Oferta, on_delete=models.CASCADE, verbose_name="Oferta")
    trabajador = models.ForeignKey(Persona, on_delete=models.CASCADE, verbose_name="Trabajador")
    fecha_postulacion = models.DateField(auto_now_add=True, verbose_name="Fecha de Postulación")
    fecha_contratacion = models.DateField(null=True, blank=True, verbose_name="Fecha de Contratación")
    estado = models.CharField(max_length=20, choices=[
        ('Pendiente', 'Pendiente'),
        ('Aprobado', 'Aprobado'),
        ('Rechazado', 'Rechazado'),
    ], default='Pendiente', verbose_name="Estado")

    def __str__(self):
        return f"{self.trabajador.usuario.username} - {self.oferta.titulo}"

class Calificacion(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, verbose_name="Empresa")
    trabajador = models.ForeignKey(Persona, on_delete=models.CASCADE, verbose_name="Trabajador")
    puntuacion = models.IntegerField(choices=[(1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5')], verbose_name="Puntuación")
    comentario = models.TextField(blank=True, null=True, verbose_name="Comentario")
    fecha_calificacion = models.DateField(auto_now_add=True, verbose_name="Fecha de Calificación")

    def __str__(self):
        return f"{self.trabajador.usuario.username} - {self.empresa.razon_social} - {self.puntuacion}"

class Ticket(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='ofertas_tickets')
    asunto = models.CharField(max_length=100, verbose_name="Asunto")
    descripcion = models.TextField(verbose_name="Descripción")
    fecha_creacion = models.DateField(auto_now_add=True, verbose_name="Fecha de Creación")
    estado = models.CharField(max_length=20, choices=[
        ('Abierto', 'Abierto'),
        ('En Progreso', 'En Progreso'),
        ('Cerrado', 'Cerrado'),
    ], default='Abierto', verbose_name="Estado")

    def __str__(self):
        return f"{self.usuario.username} - {self.asunto}"