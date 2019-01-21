from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from api.rest.serializers import UserSerializer, GroupSerializer, JokeSerializer
from api.rest.models import Joke

class UserViewSet(viewsets.ModelViewSet):
    """ Eendpoint that allows users to be viewed or edited. """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

class GroupViewSet(viewsets.ModelViewSet):
    """ Endpoint that allows groups to be viewed or edited. """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

class JokeViewSet(viewsets.ModelViewSet):
    queryset = Joke.objects.all()
    serializer_class = JokeSerializer
