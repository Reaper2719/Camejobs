from django.db import models

# Create your models here.
class Empresa(models.Model):
    nitEmpresa = models.CharField(max_length=255, blank=False, null=False)
    nombreEmpresa = models.CharField(max_length=255, blank=False, null=False)
    perfilEmpresa = models.CharField(max_length=450, blank=False, null=False)
    logoEmpresa = models.BinaryField(null=False, blank=False)
    emailEmpresa = models.CharField(max_length=255, blank=False, null=False)
    numeroEmpresa = models.CharField(max_length=255, blank=False, null=False)
    codEmpresa = models.CharField(max_length=255, blank=False, null=False)
