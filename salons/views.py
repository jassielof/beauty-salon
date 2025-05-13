# salons/views.py
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy, reverse
from django.views import generic, View
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib import messages
from django.db import transaction

from core.enums.user_roles import UserRoles  # For atomic operations with formsets

from .models import BeautySalon, Branch, OpeningHours, SocialNetwork
from .forms import (
    BeautySalonForm,
    BranchForm,
    OpeningHoursFormSet,
    SocialNetworkFormSet,  # Import the formsets
)
from accounts.models import User  # To check user role


# --- Mixin (Can be imported from accounts.views if preferred) ---
class OwnerRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    """Ensures user is logged in and is an Owner."""

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
            # Redirect to a relevant dashboard (ensure these URLs exist)
            if self.request.user.role == UserRoles.EMPLOYEE:
                return redirect(reverse_lazy("employee_dashboard"))
            elif self.request.user.role == UserRoles.CLIENT:
                return redirect(reverse_lazy("client_dashboard"))
        return super().handle_no_permission()


# --- BeautySalon CRUD ---


class BeautySalonListView(OwnerRequiredMixin, generic.ListView):
    model = BeautySalon
    template_name = "salons/beautysalon_list.html"
    context_object_name = "salons"

    def get_queryset(self):
        # Salons owned by the current logged-in user
        return BeautySalon.objects.filter(owner=self.request.user).order_by("name")


class BeautySalonDetailView(OwnerRequiredMixin, generic.DetailView):
    model = BeautySalon
    template_name = "salons/beautysalon_detail.html"
    context_object_name = "salon"

    def get_queryset(self):
        return BeautySalon.objects.filter(
            owner=self.request.user
        )  # Ensure owner can only view their salons

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Add related branches and social networks
        context["branches"] = self.object.branches.all().order_by("name")
        context["social_networks"] = self.object.social_networks.all().order_by("name")
        return context


class BeautySalonCreateView(OwnerRequiredMixin, View):
    template_name = "salons/beautysalon_form.html"

    def get(self, request, *args, **kwargs):
        salon_form = BeautySalonForm()
        social_network_formset = SocialNetworkFormSet(prefix="social")
        context = {
            "salon_form": salon_form,
            "social_network_formset": social_network_formset,
            "form_title": "Create New Beauty Salon",
        }
        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        salon_form = BeautySalonForm(
            request.POST, request.FILES
        )  # request.FILES for logo_uri if ImageField
        social_network_formset = SocialNetworkFormSet(request.POST, prefix="social")

        if salon_form.is_valid() and social_network_formset.is_valid():
            try:
                with transaction.atomic():
                    salon = salon_form.save(commit=False)
                    salon.owner = request.user  # Assign the logged-in owner
                    salon.save()  # Save salon first to get an ID

                    # Save social networks linked to the salon
                    social_network_formset.instance = salon
                    social_network_formset.save()

                messages.success(
                    request, f"Beauty Salon '{salon.name}' created successfully."
                )
                return redirect(reverse("salon_detail", kwargs={"pk": salon.pk}))
            except Exception as e:
                messages.error(request, f"An error occurred: {e}")
        else:
            messages.error(request, "Please correct the errors below.")

        context = {
            "salon_form": salon_form,
            "social_network_formset": social_network_formset,
            "form_title": "Create New Beauty Salon",
        }
        return render(request, self.template_name, context)


class BeautySalonUpdateView(OwnerRequiredMixin, View):
    template_name = "salons/beautysalon_form.html"

    def get_object(self, pk):
        return get_object_or_404(BeautySalon, pk=pk, owner=self.request.user)

    def get(self, request, pk, *args, **kwargs):
        salon = self.get_object(pk)
        salon_form = BeautySalonForm(instance=salon)
        social_network_formset = SocialNetworkFormSet(instance=salon, prefix="social")
        context = {
            "salon_form": salon_form,
            "social_network_formset": social_network_formset,
            "salon_pk": pk,
            "form_title": f"Edit Beauty Salon: {salon.name}",
        }
        return render(request, self.template_name, context)

    def post(self, request, pk, *args, **kwargs):
        salon = self.get_object(pk)
        salon_form = BeautySalonForm(request.POST, request.FILES, instance=salon)
        social_network_formset = SocialNetworkFormSet(
            request.POST, instance=salon, prefix="social"
        )

        if salon_form.is_valid() and social_network_formset.is_valid():
            try:
                with transaction.atomic():
                    salon_form.save()
                    social_network_formset.save()
                messages.success(
                    request, f"Beauty Salon '{salon.name}' updated successfully."
                )
                return redirect(reverse("salon_detail", kwargs={"pk": salon.pk}))
            except Exception as e:
                messages.error(request, f"An error occurred: {e}")
        else:
            messages.error(request, "Please correct the errors below.")

        context = {
            "salon_form": salon_form,
            "social_network_formset": social_network_formset,
            "salon_pk": pk,
            "form_title": f"Edit Beauty Salon: {salon.name}",
        }
        return render(request, self.template_name, context)


class BeautySalonDeleteView(OwnerRequiredMixin, generic.DeleteView):
    model = BeautySalon
    template_name = "salons/beautysalon_confirm_delete.html"
    success_url = reverse_lazy("salon_list")
    context_object_name = "salon"

    def get_queryset(self):
        return BeautySalon.objects.filter(owner=self.request.user)

    def form_valid(self, form):
        salon_name = self.object.name
        messages.success(
            self.request,
            f"Beauty Salon '{salon_name}' and its branches deleted successfully.",
        )
        return super().form_valid(form)


# --- Branch CRUD (Often managed in context of a BeautySalon) ---


class BranchCreateView(OwnerRequiredMixin, View):
    template_name = "salons/branch_form.html"

    def get_salon(self, salon_pk):
        # Ensure the salon exists and belongs to the current owner
        return get_object_or_404(BeautySalon, pk=salon_pk, owner=self.request.user)

    def get(self, request, salon_pk, *args, **kwargs):
        salon = self.get_salon(salon_pk)
        branch_form = BranchForm()
        opening_hours_formset = OpeningHoursFormSet(
            prefix="hours"
        )  # No instance for create
        context = {
            "branch_form": branch_form,
            "opening_hours_formset": opening_hours_formset,
            "salon": salon,
            "form_title": f"Add New Branch to {salon.name}",
        }
        return render(request, self.template_name, context)

    def post(self, request, salon_pk, *args, **kwargs):
        salon = self.get_salon(salon_pk)
        branch_form = BranchForm(request.POST)
        opening_hours_formset = OpeningHoursFormSet(request.POST, prefix="hours")

        if branch_form.is_valid() and opening_hours_formset.is_valid():
            try:
                with transaction.atomic():
                    branch = branch_form.save(commit=False)
                    branch.salon = salon  # Link to the parent salon
                    branch.save()  # Save branch first to get ID

                    opening_hours_formset.instance = branch
                    opening_hours_formset.save()

                messages.success(
                    request,
                    f"Branch '{branch.name}' added to '{salon.name}' successfully.",
                )
                return redirect(
                    reverse("salon_detail", kwargs={"pk": salon.pk})
                )  # Back to salon detail
            except Exception as e:
                messages.error(request, f"An error occurred: {e}")
        else:
            messages.error(request, "Please correct the errors below.")

        context = {
            "branch_form": branch_form,
            "opening_hours_formset": opening_hours_formset,
            "salon": salon,
            "form_title": f"Add New Branch to {salon.name}",
        }
        return render(request, self.template_name, context)


class BranchDetailView(OwnerRequiredMixin, generic.DetailView):
    model = Branch
    template_name = "salons/branch_detail.html"
    context_object_name = "branch"

    def get_queryset(self):
        # Ensure owner can only view branches of their salons
        return Branch.objects.filter(salon__owner=self.request.user).select_related(
            "salon"
        )

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["opening_hours"] = self.object.opening_hours.all().order_by(
            "day"
        )  # 'day' might need conversion to sort
        # Add employees, services later when those apps are more developed
        return context


class BranchUpdateView(OwnerRequiredMixin, View):
    template_name = "salons/branch_form.html"

    def get_object(self, branch_pk):
        # Ensure branch exists and belongs to a salon owned by the current user
        return get_object_or_404(Branch, pk=branch_pk, salon__owner=self.request.user)

    def get(self, request, branch_pk, *args, **kwargs):
        branch = self.get_object(branch_pk)
        branch_form = BranchForm(instance=branch)
        opening_hours_formset = OpeningHoursFormSet(instance=branch, prefix="hours")
        context = {
            "branch_form": branch_form,
            "opening_hours_formset": opening_hours_formset,
            "salon": branch.salon,  # Pass salon for context
            "branch_pk": branch_pk,
            "form_title": f"Edit Branch: {branch.name} ({branch.salon.name})",
        }
        return render(request, self.template_name, context)

    def post(self, request, branch_pk, *args, **kwargs):
        branch = self.get_object(branch_pk)
        branch_form = BranchForm(request.POST, instance=branch)
        opening_hours_formset = OpeningHoursFormSet(
            request.POST, instance=branch, prefix="hours"
        )

        if branch_form.is_valid() and opening_hours_formset.is_valid():
            try:
                with transaction.atomic():
                    branch_form.save()
                    opening_hours_formset.save()
                messages.success(
                    request, f"Branch '{branch.name}' updated successfully."
                )
                return redirect(reverse("branch_detail", kwargs={"pk": branch.pk}))
            except Exception as e:
                messages.error(request, f"An error occurred: {e}")
        else:
            messages.error(request, "Please correct the errors below.")

        context = {
            "branch_form": branch_form,
            "opening_hours_formset": opening_hours_formset,
            "salon": branch.salon,
            "branch_pk": branch_pk,
            "form_title": f"Edit Branch: {branch.name} ({branch.salon.name})",
        }
        return render(request, self.template_name, context)


class BranchDeleteView(OwnerRequiredMixin, generic.DeleteView):
    model = Branch
    template_name = "salons/branch_confirm_delete.html"
    context_object_name = "branch"

    def get_queryset(self):
        return Branch.objects.filter(salon__owner=self.request.user)

    def get_success_url(self):
        # Redirect to the parent salon's detail page
        messages.success(
            self.request, f"Branch '{self.object.name}' deleted successfully."
        )
        return reverse_lazy("salon_detail", kwargs={"pk": self.object.salon.pk})
