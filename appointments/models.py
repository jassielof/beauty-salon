from django.db import models

from accounts.models import CustomerProfile, EmployeeProfile
from core.enums.appointment_status import APPOINTMENT_STATUS
from core.enums.payment_methods import PAYMENT_METHODS
from salons.models import BeautySalon, Branch


# Create your models here.
from services.models import Service

class Appointment(models.Model):
    id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(CustomerProfile, on_delete=models.CASCADE)
    employee = models.ForeignKey(EmployeeProfile, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    duration = models.DurationField(null=True, blank=True)  # Keep for backward compatibility, optional now
    services = models.ForeignKey(Service, null=True, blank=True, on_delete=models.SET_NULL)  # Change to ForeignKey for single service selection
    status = models.CharField(
        max_length=50, choices=APPOINTMENT_STATUS, default="requested"
    )
    payment_method = models.CharField(
        max_length=50, choices=PAYMENT_METHODS, default="cash"
    )
    beauty_salon = models.ForeignKey(BeautySalon, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    note = models.TextField(blank=True)
