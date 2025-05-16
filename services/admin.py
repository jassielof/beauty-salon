from django.contrib import admin

from services.models import Service


# Register your models here.
@admin.register(Service)
class ServiceAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "description",
        "price",
        "duration",
        "beauty_salon",
        "branch",
    )
    search_fields = ("name", "description")
    list_filter = ("beauty_salon", "branch")
