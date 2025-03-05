from django.urls import path
from django.contrib.auth import views as auth_views
from . import views




urlpatterns = [
    path('registro/persona/', views.registro_persona, name='registro_persona'),
    path('registro/empresa/', views.registro_empresa, name='registro_empresa'),
    path('', views.inicio, name='inicio'),  # Nueva ruta para la página de inicio
    path('bienvenida/', views.bienvenida, name='bienvenida'),
    path('login/', auth_views.LoginView.as_view(template_name='usuarios/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('perfil/persona', views.perfil_persona, name='perfil_persona'),
    path('perfil/empresa', views.perfil_empresa, name='perfil_empresa'),
    path('perfil/empresa/<int:empresa_id>/', views.perfil_empresa, name='perfil_empresa'),
    path('perfil/formacion/agregar/', views.agregar_formacion, name='agregar_formacion'),
    path('perfil/formacion/editar/<int:formacion_id>/', views.editar_formacion, name='editar_formacion'),
    path('perfil/formacion/eliminar/<int:formacion_id>/', views.eliminar_formacion, name='eliminar_formacion'),
    path('perfil/experiencia/agregar/', views.agregar_experiencia, name='agregar_experiencia'),
    path('perfil/experiencia/editar/<int:experiencia_id>/', views.editar_experiencia, name='editar_experiencia'),
    path('perfil/experiencia/eliminar/<int:experiencia_id>/', views.eliminar_experiencia, name='eliminar_experiencia'),
    path('calificar/persona/<int:persona_id>/', views.calificar_persona, name='calificar_persona'),
    path('calificar/empresa/<int:empresa_id>/', views.calificar_empresa, name='calificar_empresa'),
]