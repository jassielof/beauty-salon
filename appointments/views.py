from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from django.views.generic import ListView
from django.contrib import messages
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, UpdateView, DeleteView

from .models import Appointment
from .forms import AppointmentForm

class AppointmentListView(ListView):
    model = Appointment
    template_name = 'appointments/appointment_list.html'
    context_object_name = 'appointments'
    paginate_by = 10

    def get_queryset(self):
        queryset = super().get_queryset()
        # Filtros adicionales pueden ir aquí
        return queryset.order_by('-date', '-time')

class AppointmentCreateView(CreateView):
    model = Appointment
    form_class = AppointmentForm
    template_name = 'appointments/appointment_form.html'
    success_url = reverse_lazy('appointments:list')

    def form_valid(self, form):
        response = super().form_valid(form)
        # For ForeignKey, assign directly instead of set()
        form.instance.services = form.cleaned_data['services']
        form.instance.save()
        messages.success(self.request, 'Cita creada exitosamente!')
        return response

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_title'] = 'Crear Nueva Cita'
        return context

class AppointmentUpdateView(UpdateView):
    model = Appointment
    form_class = AppointmentForm
    template_name = 'appointments/appointment_form.html'
    success_url = reverse_lazy('appointments:list')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Cita actualizada exitosamente!')
        return response

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_title'] = 'Editar Cita'
        return context

class AppointmentDeleteView(DeleteView):
    model = Appointment
    template_name = 'appointments/appointment_confirm_delete.html'
    success_url = reverse_lazy('appointments:list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, 'Cita eliminada exitosamente!')
        return super().delete(request, *args, **kwargs)

class AppointmentDetailView(View):
    template_name = 'appointments/appointment_detail.html'

    def get(self, request, pk):
        appointment = get_object_or_404(Appointment, pk=pk)
        context = {
            'appointment': appointment,
            'page_title': f'Detalles de Cita #{appointment.id}'
        }
        return render(request, self.template_name, context)