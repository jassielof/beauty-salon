
from django import forms

from core.models.user import User


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ["username", "email", "phone_number", "roles"]
        widgets = {
            "username": forms.TextInput(attrs={"class": "form-control"}),
            "email": forms.EmailInput(attrs={"class": "form-control"}),
            "phone_number": forms.TextInput(attrs={"class": "form-control"}),
            "roles": forms.Select(attrs={"class": "form-control"}),
        }