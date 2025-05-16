from django.http import Http404
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse, reverse_lazy
from django.views import View, generic
from django.contrib.auth.views import LogoutView, LoginView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.db import transaction
from django.contrib import messages

from accounts.forms import (
    CustomAuthenticationForm,
    CustomerCreationForm,
    CustomerProfileForm,
    CustomerProfileUpdateForm,
    CustomerUserUpdateForm,
    EmployeeCreationForm,
    EmployeeProfileForm,
    EmployeeProfileUpdateForm,
    EmployeeUserUpdateForm,
    OwnerSignUpForm,
)
from accounts.models import CustomerProfile, EmployeeProfile, User
from core.enums.user_roles import UserRoles


class OwnerSignUpView(generic.CreateView):
    form_class = OwnerSignUpForm
    success_url = reverse_lazy("login")
    template_name = "accounts/signup.html"

    def form_valid(self, form):
        user = form.save()
        print(user)
        return super().form_valid(form)


class CustomLogInView(LoginView):
    form_class = CustomAuthenticationForm
    template_name = "accounts/login.html"

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
        return (
            self.request.user.is_authenticated
            and self.request.user.role == UserRoles.OWNER
        )

    def handle_no_permission(self):
        if self.request.user.is_authenticated:
            messages.error(
                self.request, "You do not have permission to access this page."
            )
            if self.request.user.role == UserRoles.EMPLOYEE:
                return redirect(reverse_lazy("employee_dashboard"))
            elif self.request.user.role == UserRoles.CUSTOMER:
                return redirect(reverse_lazy("customer_dashboard"))
        return super().handle_no_permission()


class EmployeeCreateView(OwnerRequiredMixin, generic.View):
    template_name = "accounts/employee_form.html"

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
                return redirect("employees_list")
            except Exception as e:
                print(e)
        context = {"user_form": user_form, "profile_form": profile_form}
        return render(request, self.template_name, context)


class CustomerCreateView(OwnerRequiredMixin, generic.View):
    template_name = "accounts/customer_form.html"

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
                return redirect("customer_list")
            except Exception as e:
                print(e)
        context = {"user_form": user_form, "profile_form": profile_form}
        return render(request, self.template_name, context)


class CustomerListView(OwnerRequiredMixin, generic.ListView):
    model = CustomerProfile
    template_name = "accounts/customer_list.html"
    context_object_name = "customer_profiles"

    def get_queryset(self):
        """
        Option 1: List ALL clients in the system (simplest if no strict separation needed yet).
        Option 2: List clients who have appointments at the owner's branches. (More complex query)
        Let's use Option 1 for now. Modify if stricter filtering is required.
        """
        return (
            CustomerProfile.objects.all()
            .select_related("user")
            .order_by("user__last_name", "user__first_name")
        )
        # Option 2 Query (example):
        # owner = self.request.user
        # if hasattr(owner, 'owned_salons'):
        #     owner_salons = owner.owned_salons.all()
        #     # Clients who have made an appointment at a branch belonging to the owner's salon
        #     return ClientProfile.objects.filter(
        #         user__appointment__branch__salon__in=owner_salons
        #     ).select_related('user').distinct().order_by('user__last_name')
        # return ClientProfile.objects.none()


class CustomerDetailView(OwnerRequiredMixin, generic.DetailView):
    model = CustomerProfile
    template_name = "accounts/customer_detail.html"
    context_object_name = "customer_profile"

    def get_queryset(self):
        # If using Option 1 for list view, we don't need strict owner filtering here.
        # If using Option 2, apply the same filtering logic for security.
        return CustomerProfile.objects.all().select_related("user")


class CustomerUpdateView(OwnerRequiredMixin, View):
    template_name = "accounts/customer_form.html"

    def get_object(self, pk):
        # Get ClientProfile (no owner check needed if listing all clients, otherwise add checks)
        profile = get_object_or_404(
            CustomerProfile.objects.select_related("user"), pk=pk
        )
        return profile

    def get(self, request, pk, *args, **kwargs):
        profile = self.get_object(pk)
        user = profile.user
        user_form = CustomerUserUpdateForm(instance=user)
        profile_form = CustomerProfileUpdateForm(instance=profile)
        context = {
            "user_form": user_form,
            "profile_form": profile_form,
            "profile_pk": pk,
            "form_title": f"Edit Customer: {user.get_full_name() or user.email}",
        }
        return render(request, self.template_name, context)

    def post(self, request, pk, *args, **kwargs):
        profile = self.get_object(pk)
        user = profile.user
        user_form = CustomerUserUpdateForm(request.POST, instance=user)
        profile_form = CustomerProfileUpdateForm(request.POST, instance=profile)

        if user_form.is_valid() and profile_form.is_valid():
            try:
                with transaction.atomic():
                    user_form.save()
                    profile_form.save()
                messages.success(
                    request, f"Customer '{user.email}' updated successfully."
                )
                return redirect(reverse("customer_detail", kwargs={"pk": pk}))
            except Exception as e:
                messages.error(request, f"An error occurred while updating: {e}")
        else:
            messages.error(request, "Please correct the errors below.")

        context = {
            "user_form": user_form,
            "profile_form": profile_form,
            "profile_pk": pk,
            "form_title": f"Edit Customer: {user.get_full_name() or user.email}",
        }
        return render(request, self.template_name, context)


class CustomerDeleteView(OwnerRequiredMixin, generic.DeleteView):
    model = User  # Target User for deletion
    template_name = "accounts/customer_confirm_delete.html"
    context_object_name = "customer_user"
    success_url = reverse_lazy("customer_list")

    def get_queryset(self):
        # Ensure we only target users with the CLIENT role.
        # Add owner filtering here if using Option 2 logic in ListView.
        return User.objects.filter(role=User.Role.CLIENT)

    def form_valid(self, form):
        user_email = self.object.email
        messages.success(self.request, f"Customer '{user_email}' deleted successfully.")
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["profile"] = get_object_or_404(
            CustomerProfile, user=self.object
        )  # Pass profile for display name if needed
        return context


class EmployeeListView(OwnerRequiredMixin, generic.ListView):
    model = EmployeeProfile
    template_name = "accounts/employee_list.html"
    context_object_name = "employee_profiles"

    def get_queryset(self):
        owner = self.request.user
        if hasattr(owner, "owned_salons"):
            owner_salons = owner.owned_salons.all()
            return EmployeeProfile.objects.filter(
                branch__salon__in=owner_salons
            ).select_related("user", "branch", "branch__salon")
        return EmployeeProfile.objects.none()


class EmployeeDetailView(OwnerRequiredMixin, generic.DetailView):
    model = EmployeeProfile
    template_name = "accounts/employee_detail.html"
    context_object_name = "employee_profile"

    def get_queryset(self):
        owner = self.request.user
        if hasattr(owner, "owned_salons"):
            owner_salons = owner.owned_salons.all()
            return EmployeeProfile.objects.filter(
                branch__salon__in=owner_salons
            ).select_related("user", "branch", "branch__salon")
        return EmployeeProfile.objects.none()


class EmployeeUpdateView(OwnerRequiredMixin, View):
    template_name = "accounts/employee_form.html"

    def get_object(self, pk):
        owner = self.request.user
        queryset = EmployeeProfile.objects.select_related("user")
        if hasattr(owner, "owned_salons"):
            owner_salons = owner.owned_salons.all()
            profile = get_object_or_404(
                queryset.filter(branch__salon__in=owner_salons), pk=pk
            )
            return profile
        raise Http404("Employee not found or access denied.")

    def get(self, request, pk, *args, **kwargs):
        profile = self.get_object(pk)
        user = profile.user
        user_form = EmployeeUserUpdateForm(instance=user)
        profile_form = EmployeeProfileUpdateForm(instance=profile, owner=request.user)
        context = {
            "user_form": user_form,
            "profile_form": profile_form,
            "profile_pk": pk,
            "form_title": f"Edit Employee: {user.get_full_name() or user.email}",
        }
        return render(request, self.template_name, context)

    def post(self, request, pk, *args, **kwargs):
        profile = self.get_object(pk)
        user = profile.user
        user_form = EmployeeUserUpdateForm(request.POST, instance=user)
        profile_form = EmployeeProfileUpdateForm(
            request.POST, instance=profile, owner=request.user
        )

        if user_form.is_valid() and profile_form.is_valid():
            try:
                with transaction.atomic():
                    user_form.save()
                    profile_form.save()
                messages.success(
                    request, f"Employee '{user.email}' updated successfully."
                )
                return redirect(reverse("employee_detail", kwargs={"pk": pk}))
            except Exception as e:
                messages.error(request, f"An error occurred while updating: {e}")
        else:
            messages.error(request, "Please correct the errors below.")

        context = {
            "user_form": user_form,
            "profile_form": profile_form,
            "profile_pk": pk,
            "form_title": f"Edit Employee: {user.get_full_name() or user.email}",
        }
        return render(request, self.template_name, context)


class EmployeeDeleteView(OwnerRequiredMixin, generic.DeleteView):
    model = User  # We target the User for deletion, Cascade should handle profile
    template_name = "accounts/employee_confirm_delete.html"
    context_object_name = "employee_user"  # Pass user object to template
    success_url = reverse_lazy("employees_list")

    def get_queryset(self):
        """Ensure owner can only delete users who are employees in their salons."""
        owner = self.request.user
        if hasattr(owner, "owned_salons"):
            owner_salons = owner.owned_salons.all()
            # Filter Users who have an EmployeeProfile linked to a branch in owner's salons
            return User.objects.filter(
                role=User.Role.EMPLOYEE,
                employee_profile__branch__salon__in=owner_salons,
            )
        return User.objects.none()

    def form_valid(self, form):
        # Add success message before deleting
        user_email = self.object.email  # Get email before object is deleted
        messages.success(self.request, f"Employee '{user_email}' deleted successfully.")
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["profile"] = get_object_or_404(
            EmployeeProfile, user=self.object
        )  # Pass profile for display name if needed
        return context


class OwnerDashboardView(OwnerRequiredMixin, generic.TemplateView):
    template_name = "accounts/owner_dashboard.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        context["owner"] = self.request.user
        context["salons"] = user.owned_salons.all()
        return context
