from rest_framework import serializers
from .models import Trabajador

class Trabajadores_serializer (serializers.ModelSerializer):
    class Meta:
        model = Trabajador
        fields = '__all__'