from django.shortcuts import render
from rest_framework import generics, permissions
from .models import Trabajador
from .serializers import Trabajadores_serializer

# Create your views here.
class Crear_Trabajador (generics.CreateAPIView):
    serializer_class = Trabajadores_serializer
    permission_classes = [permissions.AllowAny]
