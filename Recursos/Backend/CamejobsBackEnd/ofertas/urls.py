from django.urls import path
from .views import *   

urlpatterns = [
    path('create/', Crear_Oferta.as_view(), name = 'Oferta_Crear' )
]