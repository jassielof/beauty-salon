from django.db import models

from core.models.user import User


class Owner(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    beauty_salon = models.ForeignKey(
        "BeautySalon", on_delete=models.CASCADE, related_name="owners"
    )
    date_of_birth = models.DateField()
    address = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=15, unique=True)
