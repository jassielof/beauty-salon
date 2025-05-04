from django.db import models


class UserRoles(models.TextChoices):
    ADMIN = "ADMIN", "Admin"
    EMPLOYEE = "EMPLOYEE", "Employee"
    CUSTOMER = "CUSTOMER", "Customer"
    OWNER = "OWNER", "Owner"
