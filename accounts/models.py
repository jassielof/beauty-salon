from django.conf import settings
from django.db import models
from django.contrib.auth.models import AbstractUser

from core.enums.user_roles import UserRoles


class User(AbstractUser):
    username = None
    email = models.EmailField(unique=True)
    phone_number = models.CharField(max_length=30, unique=True, blank=True, null=True)
    legal_id = models.CharField(max_length=50, blank=True)
    address = models.TextField(blank=True)
    sex = models.CharField(max_length=10, blank=True)
    birth_date = models.DateField(blank=True, null=True)
    role = models.CharField(
        max_length=10, choices=UserRoles.choices, default=UserRoles.CUSTOMER
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["first_name", "last_name"]

    def __str__(self):
        return self.email

    @property
    def is_owner(self):
        return self.role == UserRoles.OWNER

    @property
    def is_employee(self):
        return self.role == UserRoles.EMPLOYEE

    @property
    def is_customer(self):
        return self.role == UserRoles.CUSTOMER


class CustomerProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        primary_key=True,
        related_name="customer_profile",
    )
    is_loyal = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.email} - {self.is_loyal}"


class EmployeeProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        primary_key=True,
        related_name="employee_profile",
    )
    branch = models.ForeignKey(
        "salons.Branch",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name="employees",
    )
    bio = models.TextField(blank=True)
    start_date = models.DateField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.email} - {self.branch.name if self.branch else 'No Branch'}"
