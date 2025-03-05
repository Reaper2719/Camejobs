# Create your views here.
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Ticket
from .forms import TicketForm
from django.contrib import messages

@login_required
def crear_ticket(request):
    if request.method == 'POST':
        form = TicketForm(request.POST)
        if form.is_valid():
            ticket = form.save(commit=False)
            ticket.usuario = request.user  # Asigna automáticamente el usuario
            ticket.save()
            messages.success(request, '¡Ticket creado exitosamente!')
            return redirect('tickets:listar_tickets')
    else:
        form = TicketForm()
        
        
    # Limpiar mensajes después de mostrarlos
    storage = messages.get_messages(request)
    for message in storage:
        pass  # Esto asegura que los mensajes se marquen como usados
    return render(request, 'tickets/crear_ticket.html', {'form': form})

@login_required
def listar_tickets(request):
    # Limpiar mensajes después de mostrarlos
    storage = messages.get_messages(request)
    for message in storage:
        pass  # Esto asegura que los mensajes se marquen como usados
    tickets = Ticket.objects.filter(usuario=request.user).order_by('-fecha_creacion')
    return render(request, 'tickets/listar_tickets.html', {'tickets': tickets})

@login_required
def editar_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id, usuario=request.user)
    if request.method == 'POST':
        form = TicketForm(request.POST, instance=ticket)
        if form.is_valid():
            form.save()
            messages.success(request, 'Ticket actualizado exitosamente.')
            return redirect('tickets:listar_tickets')
    else:
        form = TicketForm(instance=ticket)
        
      
    # Limpiar mensajes después de mostrarlos
    storage = messages.get_messages(request)
    for message in storage:
        pass  # Esto asegura que los mensajes se marquen como usados   
    
    return render(request, 'tickets/editar_ticket.html', {'form': form})

@login_required
def eliminar_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id, usuario=request.user)
    ticket.delete()
    messages.success(request, 'Ticket eliminado exitosamente.')
    
    # Limpiar mensajes después de mostrarlos
    storage = messages.get_messages(request)
    for message in storage:
        pass  # Esto asegura que los mensajes se marquen como usados  
    
    return redirect('tickets:listar_tickets')