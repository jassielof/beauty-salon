from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.views import generic
from django.contrib.auth.views import LogoutView, LoginView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.db import transaction

from accounts.forms import (
    CustomAuthenticationForm,
    CustomerCreationForm,
    CustomerProfileForm,
    EmployeeCreationForm,
    EmployeeProfileForm,
    OwnerSignUpForm,
)
from accounts.models import CustomerProfile


class OwnerSignUpView(generic.CreateView):
    form_class = OwnerSignUpForm
    success_url = reverse_lazy("login")
    template_name = "accounts/signup.html"

    def form_valid(self, form):
        user = form.save()
        return super().form_valid(form)


class CustomLogInView(LoginView):
    form_class = CustomAuthenticationForm
    template_name = "accounts/log-in.html"

    def get_success_url(self):
        url = super().get_success_url()
        if self.request.user.is_owner:
            return reverse_lazy("owner_dashboard")
        elif self.request.user.is_employee:
            return reverse_lazy("employee_dashboard")
        elif self.request.user.is_customer:
            return reverse_lazy("customer_dashboard")
        return url


class CustomLogOutView(LogoutView):
    next_page = reverse_lazy("index")


class OwnerRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_authenticated and self.request.user.is_owner


class EmployeeCreateView(OwnerRequiredMixin, generic.View):
    template_name = "accounts/employee_add.html"

    def get(self, request, *args, **kwargs):
        user_form = EmployeeCreationForm()
        profile_form = EmployeeProfileForm(owner=request.user)
        context = {"user_form": user_form, "profile_form": profile_form}
        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        user_form = EmployeeCreationForm(request.POST)
        profile_form = EmployeeProfileForm(request.POST, owner=request.user)
        if user_form.is_valid() and profile_form.is_valid():
            try:
                with transaction.atomic():
                    new_employee_user = user_form.save()
                    profile = profile_form.save(commit=False)
                    profile.user = new_employee_user
                    profile.save()
                return redirect("some_employee_list_view")
            except Exception as e:
                print(e)
        context = {"user_form": user_form, "profile_form": profile_form}
        return render(request, self.template_name, context)


class CustomerCreateView(OwnerRequiredMixin, generic.View):
    template_name = "accounts/client_add.html"

    def get(self, request, *args, **kwargs):
        user_form = CustomerCreationForm()
        profile_form = CustomerProfileForm()
        context = {"user_form": user_form, "profile_form": profile_form}
        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        user_form = CustomerCreationForm(request.POST)
        profile_form = CustomerProfileForm(request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            try:
                with transaction.atomic():
                    new_customer_user = user_form.save()
                    profile = profile_form.save(commit=False)
                    profile.user = new_customer_user
                    profile.save()
                return redirect("some_customer_list_view")
            except Exception as e:
                print(e)
        context = {"user_form": user_form, "profile_form": profile_form}
        return render(request, self.template_name, context)


# Add Employees/Customers CRUD views using OwnerRequiredMixin
