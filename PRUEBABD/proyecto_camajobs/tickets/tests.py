# Create your tests here.
from django.urls import path
from . import views
from django.test import TestCase
app_name = 'tickets'

urlpatterns = [
    path('crear/', views.crear_ticket, name='crear_ticket'),
    path('listar/', views.listar_tickets, name='listar_tickets'),
]