from django.views.generic import ListView, CreateView, UpdateView, DetailView, DeleteView
from django.urls import reverse_lazy
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import get_object_or_404
from .models import Service
from .forms import ServiceForm

class ServiceListView(LoginRequiredMixin, ListView):
    model = Service
    template_name = 'services/service_list.html'
    context_object_name = 'services'
    paginate_by = 10

    def get_queryset(self):
        queryset = super().get_queryset()
        # Filtra por salón si el usuario no es superusuario
        if not self.request.user.is_superuser:
            queryset = queryset.filter(beauty_salon__owner=self.request.user)
        return queryset.order_by('name')

class ServiceCreateView(LoginRequiredMixin, CreateView):
    model = Service
    form_class = ServiceForm
    template_name = 'services/service_form.html'
    success_url = reverse_lazy('services:list')

    def form_valid(self, form):
        form.instance.beauty_salon = self.request.user.beautysalon
        response = super().form_valid(form)
        messages.success(self.request, f'El servicio "{self.object.name}" ha sido creado exitosamente.')
        return response

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_title'] = 'Crear Nuevo Servicio'
        return context

class ServiceUpdateView(LoginRequiredMixin, UpdateView):
    model = Service
    form_class = ServiceForm
    template_name = 'services/service_form.html'
    success_url = reverse_lazy('services:list')

    def get_queryset(self):
        queryset = super().get_queryset()
        if not self.request.user.is_superuser:
            queryset = queryset.filter(beauty_salon__owner=self.request.user)
        return queryset

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, f'El servicio "{self.object.name}" ha sido actualizado exitosamente.')
        return response

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_title'] = f'Editar Servicio: {self.object.name}'
        return context

class ServiceDetailView(LoginRequiredMixin, DetailView):
    model = Service
    template_name = 'services/service_detail.html'
    context_object_name = 'service'

    def get_queryset(self):
        queryset = super().get_queryset()
        if not self.request.user.is_superuser:
            queryset = queryset.filter(beauty_salon__owner=self.request.user)
        return queryset

class ServiceDeleteView(LoginRequiredMixin, DeleteView):
    model = Service
    template_name = 'services/service_confirm_delete.html'
    success_url = reverse_lazy('services:list')
    context_object_name = 'service'

    def get_queryset(self):
        queryset = super().get_queryset()
        if not self.request.user.is_superuser:
            queryset = queryset.filter(beauty_salon__owner=self.request.user)
        return queryset

    def delete(self, request, *args, **kwargs):
        response = super().delete(request, *args, **kwargs)
        messages.success(request, f'El servicio "{self.object.name}" ha sido eliminado.')
        return response