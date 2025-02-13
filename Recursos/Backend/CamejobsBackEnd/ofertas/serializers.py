from rest_framework import serializers
from .models import Oferta 

class Ofertas_serializer (serializers.ModelSerializer):
    class Meta: 
        model = Oferta
        fields = '__all__'