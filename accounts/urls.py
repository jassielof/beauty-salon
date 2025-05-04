from django.urls import path

from accounts import views

urlpatterns = [
    path("signup/owner/", views.OwnerSignUpView.as_view(), name="owner_signup"),
    path("login/", views.CustomLogInView.as_view(), name="login"),
    path("logout/", views.CustomLogOutView.as_view(), name="logout"),
    path(
        "manage/employees/add/", views.EmployeeCreateView.as_view(), name="employee_add"
    ),
    path(
        "manage/customers/add/", views.CustomerCreateView.as_view(), name="customer_add"
    ),
    path(
        "dashboard/owner/", views.OwnerDashboardView.as_view(), name="owner_dashboard"
    ),
]
