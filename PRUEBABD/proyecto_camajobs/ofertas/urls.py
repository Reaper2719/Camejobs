from django.urls import path
from . import views

urlpatterns = [
    path('crear/', views.crear_oferta, name='crear_oferta'),
    path('postular/<int:oferta_id>/', views.postular, name='postular'),
    path('postulaciones/<int:oferta_id>/', views.listar_postulaciones, name='listar_postulaciones'),
    path('postulacion/<int:postulacion_id>/<str:accion>/', views.gestionar_postulacion, name='gestionar_postulacion'),
    path('postulacion/<int:postulacion_id>/', views.ver_detalles_postulacion, name='ver_detalles_postulacion'),
    path('calificar_empresa/<int:postulacion_id>/', views.calificar_empresa, name='calificar_empresa'),
    path('calificar_persona/<int:postulacion_id>/', views.calificar_persona, name='calificar_persona'),

    # Ruta para pagina de ofertas
    path('pagina_ofertas/', views.pagina_ofertas, name='pagina_ofertas'),
]