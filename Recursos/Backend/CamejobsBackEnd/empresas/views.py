from django.shortcuts import render
from rest_framework import generics, permissions
from .models import Empresa
from .serializers import Empresas_serializer

# Create your views here.
class Crear_Empresa (generics.CreateAPIView):
    serializer_class = Empresas_serializer
    permissions_classes = [permissions.AllowAny]
