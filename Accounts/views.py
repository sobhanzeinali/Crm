from django.http import request
from django.shortcuts import render
from .forms import CreateUserForm
from .models import Customer
from django.contrib import messages
from django.http import HttpResponse
# Create your views here.


def registerPage(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get("username")
            email = form.cleaned_data.get("email")
            Customer.objects.create(user=user, name=username,email=email)
            return HttpResponse("Success")
            # messages.success(request, 'Account was created for ' + username)

    return render(request, "accounts/register.html", {'form': form})
