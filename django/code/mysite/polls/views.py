from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, its indexed.")

def yourMom(request):
    return HttpResponse("Nice try bro")

