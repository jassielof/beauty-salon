from django.db import models

from core.models.user import User


class BeautySalon(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    owner = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="beauty_salon_owner",
        null=True,
        blank=True,
    )
    social_media = models.ManyToManyField("SocialMedia", blank=True)
