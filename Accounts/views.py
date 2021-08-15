from django.http import request
from django.shortcuts import redirect, render
from .forms import CreateUserForm
from .models import Customer
from django.contrib import messages
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
# Create your views here.


def registerPage(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get("username")
            email = form.cleaned_data.get("email")
            Customer.objects.create(user=user, name=username, email=email)
            return redirect('login')

    return render(request, "accounts/register.html", {'form': form})


def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return HttpResponse("Login sucessfully")
        else:
            messages.info(request, "Username or password is incorrect!")

    return render(request, "accounts/login.html", {})


def logoutUser(request):
    logout(request)
    return redirect('login')
