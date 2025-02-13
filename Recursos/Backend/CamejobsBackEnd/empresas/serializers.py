from rest_framework import serializers
from .models import Empresa

class Empresas_serializer (serializers.ModelSerializer):
    class Meta:
        model = Empresa
        fields = '__all__'