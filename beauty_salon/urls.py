from django.contrib import admin
from django.urls import include, path

from core.views.index_views import IndexView

urlpatterns = [
    path("", IndexView.as_view(), name="index"),
    path("admin/", admin.site.urls),
    path("accounts/", include("accounts.urls")),
    path("salons/", include("salons.urls")),
]
