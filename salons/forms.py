# salons/forms.py
from django import forms
from django.forms import (
    inlineformset_factory,
)  # For managing related objects like OpeningHours and SocialNetworks
from .models import BeautySalon, Branch, OpeningHours, SocialNetwork
from core.enums.week_day import WeekDay  # Assuming WeekDay is in core.enums


class BeautySalonForm(forms.ModelForm):
    class Meta:
        model = BeautySalon
        fields = ["name", "address", "phone_number", "email", "description", "logo_uri"]
        # 'owner' will be set in the view
        widgets = {
            "description": forms.Textarea(attrs={"rows": 4}),
        }


class BranchForm(forms.ModelForm):
    class Meta:
        model = Branch
        fields = ["name", "address", "phone_number", "email"]
        # 'salon' will be set in the view or determined from context


# --- Forms for Inline Formsets (OpeningHours and SocialNetwork) ---


class OpeningHoursForm(forms.ModelForm):
    day = forms.ChoiceField(choices=WeekDay.choices)  # Use the WeekDay enum

    class Meta:
        model = OpeningHours
        fields = ["day", "opening_time", "closing_time"]
        widgets = {
            "opening_time": forms.TimeInput(attrs={"type": "time"}),
            "closing_time": forms.TimeInput(attrs={"type": "time"}),
        }


# We can create formsets directly in the view, or define them here for reuse
OpeningHoursFormSet = inlineformset_factory(
    Branch,  # Parent model
    OpeningHours,  # Child model
    form=OpeningHoursForm,
    fields=["day", "opening_time", "closing_time"],
    extra=1,  # Number of empty forms to display
    can_delete=True,  # Allow deletion of existing opening hours
)


class SocialNetworkForm(forms.ModelForm):
    class Meta:
        model = SocialNetwork
        fields = ["name", "url"]


SocialNetworkFormSet = inlineformset_factory(
    BeautySalon,  # Parent model
    SocialNetwork,  # Child model
    form=SocialNetworkForm,
    fields=["name", "url"],
    extra=1,
    can_delete=True,
)
