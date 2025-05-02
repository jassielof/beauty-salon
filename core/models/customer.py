from django.db import models
from .user import User


class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    date_of_birth = models.DateField()
    address = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=15, unique=True)
    beauty_salon = models.ForeignKey("BeautySalon", on_delete=models.CASCADE)
