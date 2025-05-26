from django import forms
from .models import Appointment
from core.enums.appointment_status import APPOINTMENT_STATUS
from core.enums.payment_methods import PAYMENT_METHODS

from services.models import Service


class AppointmentForm(forms.ModelForm):
    services = forms.ModelChoiceField(
        queryset=Service.objects.all(),
        widget=forms.Select,
        required=False,
        label="Servicio",
    )

    class Meta:
        model = Appointment
        exclude = ["duration"]
        widgets = {
            "date": forms.DateInput(attrs={"type": "date"}),
            "time": forms.TimeInput(attrs={"type": "time"}),
            "status": forms.Select(choices=APPOINTMENT_STATUS),
            "payment_method": forms.Select(choices=PAYMENT_METHODS),
            "note": forms.Textarea(attrs={"rows": 3}),
        }
        labels = {
            "customer": "Cliente",
            "employee": "Empleado",
            "date": "Fecha",
            "time": "Hora",
            "status": "Estado",
            "payment_method": "Método de Pago",
            "beauty_salon": "Salón de Belleza",
            "branch": "Sucursal",
            "note": "Notas",
        }
