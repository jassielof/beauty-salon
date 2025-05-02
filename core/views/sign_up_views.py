from django.shortcuts import redirect, render
from core.forms.sign_up_form import SignUpForm
from django.contrib.auth import login


def sign_up(request):
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("index")
    else:
        form = SignUpForm()
    return render(request, "core/sign_up.html", {"form": form})
