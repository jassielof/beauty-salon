from django.urls import path
from .views import (
    AppointmentListView,
    AppointmentCreateView,
    AppointmentUpdateView,
    AppointmentDeleteView,
    AppointmentDetailView
)

app_name = 'appointments'

urlpatterns = [
    path('', AppointmentListView.as_view(), name='list'),
    path('create/', AppointmentCreateView.as_view(), name='create'),
    path('<int:pk>/', AppointmentDetailView.as_view(), name='detail'),
    path('<int:pk>/update/', AppointmentUpdateView.as_view(), name='update'),
    path('<int:pk>/delete/', AppointmentDeleteView.as_view(), name='delete'),
]