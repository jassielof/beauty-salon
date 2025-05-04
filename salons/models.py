from django.conf import settings
from django.db import models
from core.enums.user_roles import UserRoles
from core.enums.week_day import WeekDay
from core.models.base import TimestampedModel


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


class OpeningHours(TimestampedModel):
    branch = models.ForeignKey(
        Branch,
        on_delete=models.CASCADE,
        related_name="opening_hours",
    )
    day = models.CharField(max_length=3, choices=WeekDay.choices)
    opening_time = models.TimeField()
    closing_time = models.TimeField()

    class Meta:
        unique_together = ("branch", "day")
        verbose_name_plural = "Opening Hours"

    def __str__(self):
        return f"{self.branch.name} - {self.get_day_display()}: {self.opening_time} - {self.closing_time}"


class SocialNetwork(TimestampedModel):
    salon = models.ForeignKey(
        BeautySalon,
        on_delete=models.CASCADE,
        related_name="social_networks",
    )
    name = models.CharField(max_length=100)
    url = models.URLField()

    def __str__(self):
        return f"{self.salon.name} - {self.name}"
