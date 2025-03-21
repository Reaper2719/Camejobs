from django import forms
from .models import Oferta
from django.forms import DateInput

class OfertaForm(forms.ModelForm):
    class Meta:
        model = Oferta
        fields = ['titulo', 'descripcion', 'salario', 'fecha_cierre', 'ubicacion']
        widgets = {
            'fecha_cierre': DateInput(attrs={
                'type': 'date',  # Usar input tipo fecha
                'placeholder': 'AAAA-MM-DD',  # Placeholder
                
            }),
        }