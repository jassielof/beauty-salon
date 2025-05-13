from django.urls import path
from django.views import generic

from accounts import views

urlpatterns = [
    path("signup/owner/", views.OwnerSignUpView.as_view(), name="owner_signup"),
    path("login/", views.CustomLogInView.as_view(), name="login"),
    path("logout/", views.CustomLogOutView.as_view(), name="logout"),
    path(
        "manage/employees/add/", views.EmployeeCreateView.as_view(), name="employee_add"
    ),
    path("manage/employees/", views.EmployeeListView.as_view(), name="employees_list"),
    path(
        "manage/employees/<int:pk>/",
        views.EmployeeDetailView.as_view(),
        name="employee_detail",
    ),
    path(
        "manage/employees/<int:pk>/edit/",
        views.EmployeeUpdateView.as_view(),
        name="employee_edit",
    ),
    path(
        "manage/employees/<int:pk>/delete/",
        views.EmployeeDeleteView.as_view(),
        name="employee_delete",
    ),
    path(
        "manage/customers/add/", views.CustomerCreateView.as_view(), name="customer_add"
    ),
    path("manage/customers/", views.CustomerListView.as_view(), name="customers_list"),
    path(
        "manage/customers/<int:pk>/",
        views.CustomerDetailView.as_view(),
        name="customer_detail",
    ),
    path(
        "manage/customers/<int:pk>/edit/",
        views.CustomerUpdateView.as_view(),
        name="customer_edit",
    ),
    path(
        "manage/customers/<int:pk>/delete/",
        views.CustomerDeleteView.as_view(),
        name="customer_delete",
    ),
    path(
        "dashboard/owner/", views.OwnerDashboardView.as_view(), name="owner_dashboard"
    ),
    path(
        "home/",
        generic.TemplateView.as_view(template_name="placeholder.html"),
        name="home",
    ),  # Define home if used in redirects
]
