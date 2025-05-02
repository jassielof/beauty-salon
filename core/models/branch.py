from django.db import models
from .beauty_salon import BeautySalon


class Branch(models.Model):
    address = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20, unique=True, null=True)
    beauty_salon = models.ForeignKey(BeautySalon, on_delete=models.CASCADE, null=True)
