from django.urls import path
from . import views

app_name = 'tickets'

urlpatterns = [
    path('crear/', views.crear_ticket, name='crear_ticket'),
    path('listar/', views.listar_tickets, name='listar_tickets'),
    path('editar/<int:ticket_id>/', views.editar_ticket, name='editar_ticket'),
    path('eliminar/<int:ticket_id>/', views.eliminar_ticket, name='eliminar_ticket'),
    
]