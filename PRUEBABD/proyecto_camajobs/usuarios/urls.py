from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
#Cambiar contraseña y validar
from .forms import CustomAuthenticationForm

urlpatterns = [
    # Página principal
    path('', views.pagina_principal, name='paginaPrincipal'),

    # Ruta para la vista de inicio de sesión
    path('login/', views.CustomLoginView.as_view(), name='login'),

    # Ruta para la vista de inicio (opcional)
    path('inicio/', views.inicio, name='inicio'),

    # Ruta para la vista de bienvenida
    path('bienvenida/', views.bienvenida, name='bienvenida'),

    # Ruta para cerrar sesión
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),

    # Rutas de registro
    path('registro/persona/', views.registro_persona, name='registro_persona'),
    path('registro/empresa/', views.registro_empresa, name='registro_empresa'),

    # Rutas de perfil
    path('perfil/persona/', views.perfil_persona, name='perfil_persona'),
    path('perfil/empresa/', views.perfil_empresa, name='perfil_empresa'),

    # Rutas para agregar, editar y eliminar formación académica
    path('perfil/formacion/agregar/', views.agregar_formacion, name='agregar_formacion'),
    path('perfil/formacion/editar/<int:formacion_id>/', views.editar_formacion, name='editar_formacion'),
    path('perfil/formacion/eliminar/<int:formacion_id>/', views.eliminar_formacion, name='eliminar_formacion'),

    # Rutas para agregar, editar y eliminar experiencia laboral
    path('perfil/experiencia/agregar/', views.agregar_experiencia, name='agregar_experiencia'),
    path('perfil/experiencia/editar/<int:experiencia_id>/', views.editar_experiencia, name='editar_experiencia'),
    path('perfil/experiencia/eliminar/<int:experiencia_id>/', views.eliminar_experiencia, name='eliminar_experiencia'),

    # Rutas para calificar personas y empresas
    path('calificar/persona/<int:persona_id>/', views.calificar_persona, name='calificar_persona'),
    path('calificar/empresa/<int:empresa_id>/', views.calificar_empresa, name='calificar_empresa'),

    # Ruta para FAQS
    path('faqs_pagina/', views.faqs_pagina, name='faqs_pagina'),

    #Ruta para pagina perfiles
    path('busquedas_pagina/', views.busquedas_pagina, name='busquedas_pagina'),
    
    #Rutas para cambiar contraseña
    path('reset-password/', auth_views.PasswordResetView.as_view(template_name='usuarios/reset_password.html'), name='password_reset'),
    path('reset-password/done/', auth_views.PasswordResetDoneView.as_view(template_name='usuarios/reset_password_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='usuarios/reset_password_confirm.html'), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name='usuarios/reset_password_complete.html'), name='password_reset_complete'),
    
    #confimar gmail
    path('confirmar-email/<str:uidb64>/<str:token>/',views.confirmar_email,name='confirmar-email'),
    path('confirmacion-enviada/', views.confirmacion_enviada, name='confirmacion-enviada'),
]