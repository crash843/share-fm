from django.conf import settings
from django.db import models


class PlayList(models.Model):
    title = models.CharField(max_length=128, null=True, blank=True)
    slug = models.CharField(max_length=16)
    author = models.ForeignKey(settings.AUTH_USER_MODEL)
    last_processed_pl = models.ForeignKey('UserPlayList')
    created = models.DateTimeField(auto_now_add=True)


class BasePlayListItem(models.Model):
    artist = models.CharField(max_length=512, null=True, blank=True)
    title = models.CharField(max_length=512, null=True, blank=True)
    genre = models.ForeignKey('Genre')
    duration = models.PositiveSmallIntegerField()
    vk_album_id = models.IntegerField()
    vk_lyrics_id = models.IntegerField()
    vk_audio_id = models.IntegerField()
    vk_mp3_url = models.CharField(max_length='2000')
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        abstract = True


class PlayListItem(BasePlayListItem):
    author = models.ForeignKey(settings.AUTH_USER_MODEL)


class UserPlayList(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    created = models.DateTimeField(auto_now_add=True)


class UserPlayListItem(models.Model):
    pl_item = models.ForeignKey(PlayListItem)
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    created = models.DateTimeField(auto_now_add=True)


class Genre(models.Model):
    title = models.CharField(max_length=128)
    vk_genre_id = models.IntegerField()
