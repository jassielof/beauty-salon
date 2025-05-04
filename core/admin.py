from django.contrib import admin

from accounts.models import User
from salons.models import BeautySalon, Branch, SocialNetwork


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ("username", "email", "phone_number", "roles", "is_superuser")
    search_fields = ("username", "email", "phone_number")
    list_filter = ("roles",)
    ordering = ("username",)


@admin.register(BeautySalon)
class BeautySalonAdmin(admin.ModelAdmin):
    list_display = ("name",)
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
