from django.db import models


class TimestampedModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True
        ordering = ["-created_at"]
        get_latest_by = "created_at"
        indexes = [
            models.Index(fields=["-created_at"]),
            models.Index(fields=["-updated_at"]),
        ]
