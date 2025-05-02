from django.urls import reverse_lazy
from django.views.generic import (
    ListView,
    CreateView,
    UpdateView,
    DeleteView,
    DetailView,
)

from core.forms import AppointmentForm
from core.models import Appointment


class AppointmentListView(ListView):
    model = Appointment
    template_name = "core/appointments/list.html"
    context_object_name = "appointments"


class AppointmentDetailView(DetailView):
    model = Appointment
    template_name = "core/appointments/detail.html"
    context_object_name = "appointment"


class AppointmentCreateView(CreateView):
    model = Appointment
    form_class = AppointmentForm
    template_name = "core/appointments/create.html"
    success_url = reverse_lazy("appointment-list")


class AppointmentUpdateView(UpdateView):
    model = Appointment
    form_class = AppointmentForm
    template_name = "core/appointments/create.html"
    success_url = reverse_lazy("appointment-list")


class AppointmentDeleteView(DeleteView):
    model = Appointment
    template_name = "core/appointments/delete.html"
    success_url = reverse_lazy("appointment-list")

