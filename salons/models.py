from django.conf import settings
from django.db import models
from core.enums.user_roles import UserRoles
from core.models import TimestampedModel


class BeautySalon(TimestampedModel):
    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="owned_salon",
        limit_choices_to={"role": UserRoles.OWNER},
    )
    name = models.CharField(max_length=200)
    address = models.TextField()
    phone_number = models.CharField(max_length=30, unique=True)
    email = models.EmailField(unique=True)
    description = models.TextField(blank=True)
    logo_uri = models.URLField(blank=True)

    def __str__(self):
        return self.name


class Branch(TimestampedModel):
    salon = models.ForeignKey(
        BeautySalon,
        on_delete=models.CASCADE,
        related_name="branches",
    )
    name = models.CharField(max_length=200)
    address = models.TextField()
    phone_number = models.CharField(max_length=30, unique=True)
    email = models.EmailField(unique=True)
    description = models.TextField(blank=True)
    logo_uri = models.URLField(blank=True)

    def __str__(self):
        return self.name
