from django import forms
from .models import Service
from salons.models import BeautySalon, Branch

class ServiceForm(forms.ModelForm):
    class Meta:
        model = Service
        fields = ['name', 'description', 'price', 'duration', 'branch']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'duration': forms.TimeInput(attrs={'type': 'time'}),
        }
        labels = {
            'name': 'Nombre del Servicio',
            'description': 'Descripción',
            'price': 'Precio',
            'duration': 'Duración',
            'branch': 'Sucursal',
        }

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)
        super().__init__(*args, **kwargs)
        
        if self.user and not self.user.is_superuser:
            # CORRECTED: Changed 'beauty_salon' to 'salon' to match your model
            self.fields['branch'].queryset = Branch.objects.filter(
                salon__owner=self.user
            )