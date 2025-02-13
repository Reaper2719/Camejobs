from django.urls import path
from .views import *

urlpatterns = [
    path('create/', Crear_Trabajador.as_view(), name = 'Trabajador_Crear') 
]