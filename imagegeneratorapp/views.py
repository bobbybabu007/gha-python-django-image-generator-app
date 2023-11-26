from django.shortcuts import render
from django.http import HttpResponse
import os
import time
import socket
import requests
import random

def index(request):
    return render(request, "index.html")

def page1(request):
    return render(request, "page1.html")

def page2(request):
    return render(request, "page2.html")

def page3(request):
    return render(request, "page3.html")

def download_random_picture(request):
    # List of 4K picture URLs
    picture_urls = [
        "https://picsum.photos/4096/2160",
        "https://picsum.photos/3840/2160"]

    # Choose a random URL from the list
    picture_url = random.choice(picture_urls)

    # Download the picture from the URL
    response = requests.get(picture_url)

    # Check if the download was successful
    if response.status_code == 200:
        # Save the picture to the local file system
        with open("random_ picture.jpg", "wb") as picture_file:
            picture_file.write(response.content)
        print("Successfully downloaded random picture.")

    else:
        print("Failed to download random picture.")
    pass
