from django.db import models


# Create your models here.
class Service(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    duration = models.DurationField()
    beauty_salon = models.ForeignKey(
        "salons.BeautySalon", on_delete=models.CASCADE, related_name="services"
    )
    branch = models.ForeignKey(
        "salons.Branch", on_delete=models.CASCADE, related_name="services"
    )

    def __str__(self):
        return self.name
