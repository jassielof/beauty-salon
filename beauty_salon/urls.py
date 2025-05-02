from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path

from core.views.sign_up_views import sign_up
from core.views.user_views import (
    UserCreateView,
    UserDeleteView,
    UserDetailView,
    UserListView,
    UserUpdateView,
)

from core.views.index_views import IndexView

urlpatterns = [
    path("", IndexView.as_view(), name="index"),
    path("sign-up/", sign_up, name="sign-up"),
    path(
        "log-in/",
        auth_views.LoginView.as_view(template_name="core/log_in.html"),
        name="log-in",
    ),
    path(
        "log-out/",
        auth_views.LogoutView.as_view(
            next_page="/",
        ),
        name="log-out",
    ),
    path("admin/", admin.site.urls),
    path("users/", UserListView.as_view(), name="user-list"),
    path("users/<int:pk>/", UserDetailView.as_view(), name="user-detail"),
    path("users/create/", UserCreateView.as_view(), name="user-create"),
    path("users/<int:pk>/edit/", UserUpdateView.as_view(), name="user-edit"),
    path("users/<int:pk>/delete/", UserDeleteView.as_view(), name="user-delete"),
]
