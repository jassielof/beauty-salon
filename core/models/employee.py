from django.db import models
from .user import User


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    hire_date = models.DateField()
    position = models.CharField(max_length=100)
    beauty_salon = models.ForeignKey("BeautySalon", on_delete=models.CASCADE)
