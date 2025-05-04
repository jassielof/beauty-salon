from django.contrib import admin

from salons.models import BeautySalon, Branch, SocialNetwork


# Register your models here.
@admin.register(BeautySalon)
class BeautySalonAdmin(admin.ModelAdmin):
    list_display = ("name", "owner")
    search_fields = ("name",)
    ordering = ("name",)


@admin.register(SocialNetwork)
class SocialNetworkAdmin(admin.ModelAdmin):
    list_display = ("name", "url")
    search_fields = ("name",)
    ordering = ("name",)


@admin.register(Branch)
class BranchAdmin(admin.ModelAdmin):
    list_display = ("address",)
    search_fields = ("address",)
    ordering = ("address",)
