# Create your models here.
from django.db import models
from django.contrib.auth.models import User

class Ticket(models.Model):
    ESTADOS = [
        ('Abierto', 'Abierto'),
        ('En progreso', 'En progreso'),
        ('Cerrado', 'Cerrado'),
    ]

    TIPOS = [
        ('Soporte técnico', 'Soporte técnico'),
        ('Problema de cuenta', 'Problema de cuenta'),
        ('Reporte de error', 'Reporte de error'),
        ('General', 'General'),
    ]

    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='tickets_tickets')
    titulo = models.CharField(max_length=200, verbose_name="Título")
    descripcion = models.TextField(verbose_name="Descripción")
    fecha_creacion = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    estado = models.CharField(max_length=20, choices=ESTADOS, default='Abierto', verbose_name="Estado")
    tipo = models.CharField(max_length=20, choices=TIPOS, default='General', verbose_name="Tipo de ticket")

    def __str__(self):
        return f"{self.titulo} - {self.estado} ({self.usuario.username})"