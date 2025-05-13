from django import forms
from django.contrib.auth.forms import (
    UserCreationForm,
    UserChangeForm,
    AuthenticationForm,
)

from accounts.models import CustomerProfile, EmployeeProfile, User
from core.enums.user_roles import UserRoles
from salons.models import Branch


class OwnerSignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True)
    last_name = forms.CharField(max_length=30, required=True)
    phone_number = forms.CharField(max_length=30, required=True)
    legal_id = forms.CharField(max_length=50, required=True)

    class Meta(UserCreationForm.Meta):
        model = User
        fields = ("email", "first_name", "last_name", "phone_number", "legal_id")

    def save(self, commit=True):
        user = super().save(commit=False)
        user.role = UserRoles.OWNER
        if commit:
            user.save()
        return user


class CustomAuthenticationForm(AuthenticationForm):
    pass


class EmployeeCreationForm(forms.ModelForm):
    password = forms.CharField(
        widget=forms.PasswordInput,
        help_text="Set an initial password for the employee.",
    )

    class Meta:
        model = User
        fields = (
            "email",
            "first_name",
            "last_name",
            "phone_number",
            "legal_id",
            "password",
        )

    def save(self, commit=True):
        user = super().save(commit=False)
        user.role = UserRoles.EMPLOYEE
        user.set_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user


class EmployeeProfileForm(forms.ModelForm):
    class Meta:
        model = EmployeeProfile
        fields = ("branch", "bio", "start_date")

    def __init__(self, *args, **kwargs):
        owner = kwargs.pop("owner", None)
        super().__init__(*args, **kwargs)
        if owner and hasattr(owner, "owned_salons"):
            owner_salons = owner.owned_salons.all()
            branches_queryset = Branch.objects.filter(salon__in=owner_salons)
            self.fields["branch"].queryset = branches_queryset
        else:
            self.fields["branch"].queryset = Branch.objects.none()


class CustomerCreationForm(forms.ModelForm):
    password = forms.CharField(
        widget=forms.PasswordInput, help_text="Set an initial password for the client."
    )

    class Meta:
        model = User
        fields = (
            "email",
            "first_name",
            "last_name",
            "phone_number",
            "legal_id",
            "password",
        )

    def save(self, commit=True):
        user = super().save(commit=False)
        user.role = UserRoles.CUSTOMER
        user.set_password(self.cleaned_date["password"])
        if commit:
            user.save()
        return user


class CustomerProfileForm(forms.ModelForm):
    class Meta:
        model = CustomerProfile
        fields = ("is_loyal",)


class EmployeeUserUpdateForm(forms.ModelForm):
    class Meta:
        model = User
        fields = (
            "email",
            "first_name",
            "last_name",
            "phone_number",
            "legal_id",
            "address",
            "sex",
            "gender",
            "birth_date",
            "is_active",
        )


class EmployeeProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = EmployeeProfile
        fields = ("branch", "bio", "start_date")

    def __init__(self, *args, **kwargs):
        owner = kwargs.pop("owner", None)
        super().__init__(*args, **kwargs)
        if owner and hasattr(owner, "owned_salons"):
            owner_salons = owner.owned_salons.all()
            branches_queryset = Branch.objects.filter(salon__in=owner_salons)
            self.fields["branch"].queryset = branches_queryset
            if self.instance and self.instance.branch:
                if self.instance.branch not in branches_queryset:
                    self.fields["branch"].queryset = (
                        branches_queryset
                        | Branch.objects.filter(pk=self.instance.branch.pk)
                    )
        else:
            self.fields["branch"].queryset = Branch.objects.none()


class CustomerUserUpdateForm(forms.ModelForm):
    class Meta:
        model = User
        fields = (
            "email",
            "first_name",
            "last_name",
            "phone_number",
            "legal_id",
            "address",
            "sex",
            "gender",
            "birth_date",
            "is_active",
        )


class CustomerProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = CustomerProfile
        fields = ("is_loyal",)
