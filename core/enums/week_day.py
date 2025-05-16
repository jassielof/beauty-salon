from django.db import models
from django.utils.translation import gettext_lazy as _


class WeekDay(models.TextChoices):
    MONDAY = "MON", _("Monday")
    TUESDAY = "TUE", _("Tuesday")
    WEDNESDAY = "WED", _("Wednesday")
    THURSDAY = "THU", _("Thursday")
    FRIDAY = "FRI", _("Friday")
    SATURDAY = "SAT", _("Saturday")
    SUNDAY = "SUN", _("Sunday")

    @classmethod
    def get_label(cls, day):
        """Get the human-readable label for a day code."""
        return cls(day).label
