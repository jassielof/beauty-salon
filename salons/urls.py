# salons/urls.py
from django.urls import path
from . import views

urlpatterns = [
    # BeautySalon URLs
    path(
        "", views.BeautySalonListView.as_view(), name="salon_list"
    ),  # List of owner's salons
    path("create/", views.BeautySalonCreateView.as_view(), name="salon_create"),
    path("<int:pk>/", views.BeautySalonDetailView.as_view(), name="salon_detail"),
    path("<int:pk>/edit/", views.BeautySalonUpdateView.as_view(), name="salon_edit"),
    path(
        "<int:pk>/delete/", views.BeautySalonDeleteView.as_view(), name="salon_delete"
    ),
    # Branch URLs (nested under salon conceptually, but flat for simplicity here)
    # Alternatively, could be /salons/<int:salon_pk>/branches/create/
    path(
        "salon/<int:salon_pk>/branches/add/",
        views.BranchCreateView.as_view(),
        name="branch_create",
    ),
    path(
        "branches/<int:pk>/", views.BranchDetailView.as_view(), name="branch_detail"
    ),  # pk here is branch_pk
    path(
        "branches/<int:pk>/edit/", views.BranchUpdateView.as_view(), name="branch_edit"
    ),
    path(
        "branches/<int:pk>/delete/",
        views.BranchDeleteView.as_view(),
        name="branch_delete",
    ),
]
