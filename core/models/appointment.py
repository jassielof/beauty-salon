from django.db import models

from core.enums.appointment_status import APPOINTMENT_STATUS
from core.enums.payment_methods import PAYMENT_METHODS
from core.models.beauty_salon import BeautySalon
from core.models.branch import Branch
from core.models.customer import Customer
from core.models.employee import Employee


class Appointment(models.Model):
    id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    duration = models.DurationField()
    status = models.CharField(
        max_length=50, choices=APPOINTMENT_STATUS, default="requested"
    )
    payment_method = models.CharField(
        max_length=50, choices=PAYMENT_METHODS, default="cash"
    )
    beauty_salon = models.ForeignKey(BeautySalon, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    note = models.TextField(blank=True, null=True)
