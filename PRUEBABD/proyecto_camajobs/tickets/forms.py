from django import forms
from .models import Ticket

class TicketForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields = ['titulo', 'tipo', 'descripcion']
        widgets = {
            'descripcion': forms.Textarea(attrs={'rows': 4}),
        }
        labels = {
            'titulo': 'Título del ticket',
            'tipo': 'Categoría',
            'descripcion': 'Descripción detallada',
        }