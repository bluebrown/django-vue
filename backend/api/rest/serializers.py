from django.contrib.auth.models import User, Group
from rest_framework import serializers
from api.rest.models import Joke

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')

class JokeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Joke
        fields = ('url', 'text')
