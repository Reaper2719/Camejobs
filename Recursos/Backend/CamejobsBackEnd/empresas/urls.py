from django.urls import path
from .views import * 

urlpatterns = [
    path('create/', Crear_Empresa.as_view(), name = 'Empresa_Crear')
]