from django.shortcuts import render
from rest_framework import generics, permissions
from .models import Oferta
from .serializers import Ofertas_serializer

# Create your views here.
class Crear_Oferta (generics.CreateAPIView): 
    serializer_class = Ofertas_serializer
    permissions_classes = [permissions.AllowAny]
    