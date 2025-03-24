def perfil_usuario(request):
    contexto = {}

    if request.user.is_authenticated:
        try:
            if hasattr(request.user, 'persona'):
                contexto['persona'] = request.user.persona
            elif hasattr(request.user, 'empresa'):
                contexto['empresa'] = request.user.empresa
        except Exception:
            pass

    return contexto