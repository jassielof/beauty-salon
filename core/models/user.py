from django.contrib.auth.models import AbstractUser

from django.db import models
from core.enums.user_roles import USER_ROLES


class User(AbstractUser):
    # Add any additional fields you want for your user model
    phone_number = models.CharField(max_length=15, unique=True)
    email = models.EmailField(unique=True)
    roles = models.CharField(max_length=50, choices=USER_ROLES, default="customer")
