from django.urls import reverse_lazy
from django.views.generic import (
    ListView,
    CreateView,
    UpdateView,
    DeleteView,
    DetailView,
)

from core.forms import UserForm
from core.models import User


class UserListView(ListView):
    model = User
    template_name = "core/users/list.html"
    context_object_name = "users"


class UserDetailView(DetailView):
    model = User
    template_name = "core/users/detail.html"
    context_object_name = "user"


class UserCreateView(CreateView):
    model = User
    form_class = UserForm
    template_name = "core/users/create.html"
    success_url = reverse_lazy("user-list")


class UserUpdateView(UpdateView):
    model = User
    form_class = UserForm
    template_name = "core/users/create.html"
    success_url = reverse_lazy("user-list")


class UserDeleteView(DeleteView):
    model = User
    template_name = "core/users/delete.html"
    success_url = reverse_lazy("user-list")
