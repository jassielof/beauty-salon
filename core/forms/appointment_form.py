from django import forms

from core.models.appointment import Appointment


class AppointmentForm(forms.ModelForm):
    class Meta:
        model = Appointment
        fields = [
            "customer",
            "employee",
            "date",
            "time",
            "duration",
            "status",
            "payment_method",
            "beauty_salon",
            "branch",
            "note",
        ]
        widgets = {
            "customer": forms.Select(attrs={"class": "form-control"}),
            "employee": forms.Select(attrs={"class": "form-control"}),
            "date": forms.DateInput(attrs={"class": "form-control", "type": "date"}),
            "time": forms.TimeInput(attrs={"class": "form-control", "type": "time"}),
            "duration": forms.TextInput(attrs={"class": "form-control"}),
            "status": forms.Select(attrs={"class": "form-control"}),
            "payment_method": forms.Select(attrs={"class": "form-control"}),
            "beauty_salon": forms.Select(attrs={"class": "form-control"}),
            "branch": forms.Select(attrs={"class": "form-control"}),
            "note": forms.Textarea(
                attrs={
                    "class": "form-control",
                    "rows": 3,
                    "placeholder": "Add a note (optional)",
                }
            ),
        }
