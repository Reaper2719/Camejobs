from django.db import models
from empresas.models import Empresa

# Create your models here.
class Oferta(models.Model):
    salarioOferta = models.IntegerField(blank=False, null=False)
    fechaPublicacion = models.DateTimeField (blank=False, null=False)
    disponibilidad = models.CharField(max_length=255, blank=False, null=False)
    experienciaOferta = models.CharField(max_length=255, blank=False, null=False)
    descripcionOferta = models.CharField(max_length=255, blank=False, null=False)
    modalidadOferta = models.CharField(max_length=255, blank=False, null=False)
    horLaboralOferta = models.CharField(max_length=255, blank=False, null=False)
    requisitosOferta = models.CharField(max_length=255, blank=False, null=False)
    seleccionOferta = models.CharField(max_length=255, blank=False, null=False)
    ubiOferta = models.CharField(max_length=255, blank=False, null=False)
    numeroEmpresa = models.CharField(max_length=255, blank=False, null=False)
    emailEmpresa = models.CharField(max_length=255, blank=False, null=False)
    tituloOferta = models.CharField (max_length=255, blank=False)
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, related_name="ofertas", null=True, blank=True)