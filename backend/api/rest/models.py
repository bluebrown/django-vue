from django.db import models

class Joke(models.Model):
    text = models.CharField(max_length=250)

