# Register your models here.
from django.contrib import admin
from .models import Ticket

@admin.register(Ticket)
class TicketAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'usuario', 'estado', 'tipo', 'fecha_creacion')
    list_filter = ('estado', 'tipo')
    search_fields = ('titulo', 'usuario__username')