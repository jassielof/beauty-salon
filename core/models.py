from django.db import models
from django.contrib.auth.models import AbstractUser

PAYMENT_METHODS = [
    ("cash", "Cash"),
    ("credit_card", "Credit Card"),
    ("debit_card", "Debit Card"),
    ("mobile_payment", "Mobile Payment"),
    ("bank_transfer", "Bank Transfer"),
]

USER_ROLES = [
    ("admin", "Admin"),
    ("employee", "Employee"),
    ("customer", "Customer"),
    ("owner", "Owner"),
]

APPOINTMENT_STATUS = [
    ("requested", "Requested"),
    ("pending", "Pending"),
    ("confirmed", "Confirmed"),
    ("completed", "Completed"),
    ("canceled", "Canceled"),
]


class User(AbstractUser):
    # Add any additional fields you want for your user model
    phone_number = models.CharField(max_length=15, unique=True)
    email = models.EmailField(unique=True)
    roles = models.CharField(max_length=50, choices=USER_ROLES, default="customer")


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    hire_date = models.DateField()
    position = models.CharField(max_length=100)
    beauty_salon = models.ForeignKey("BeautySalon", on_delete=models.CASCADE)


class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    date_of_birth = models.DateField()
    address = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=15, unique=True)
    beauty_salon = models.ForeignKey("BeautySalon", on_delete=models.CASCADE)


class Owner(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    beauty_salon = models.ForeignKey(
        "BeautySalon", on_delete=models.CASCADE, related_name="owners"
    )
    date_of_birth = models.DateField()
    address = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=15, unique=True)


class BeautySalon(models.Model):
    name = models.CharField(max_length=100)
    owner = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="beauty_salon_owner",
        null=True,
        blank=True,
    )
    social_media = models.ManyToManyField("SocialMedia", blank=True)


class SocialMedia(models.Model):
    name = models.CharField(max_length=100)
    url = models.URLField()


class Branch(models.Model):
    address = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20, unique=True, null=True)
    beauty_salon = models.ForeignKey(BeautySalon, on_delete=models.CASCADE, null=True)


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
