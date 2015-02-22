import json
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import TemplateView, DetailView
from share_fm.player.models import PlayList, UserPlayList


class PlayerIndex(TemplateView):
    template_name = 'player/index.html'

player_index = PlayerIndex.as_view()


class PlayerDetails(DetailView):
    pass

player_details = PlayerDetails.as_view()

def serialize_playlist_item(item):
    return {
        "artist": item.artist,
        "title": item.title,
        "genre": item.genre,
        "duration": item.duration,
        "url": item.vk_mp3_url
    }

def get_playlist(request, pk):
    playlist = PlayList.objects.get(pk=pk)

    return HttpResponse(json.dumps({
        "title": playlist.title or None,
        "author": {
            "id": playlist.author.pk,
            "name": playlist.author.username
        },
        "tracks": [serialize_playlist_item(item) for item in playlist.items.all()]
    }))

@csrf_exempt
def create_playlist(request):
    if request.method != "POST":
        return HttpResponseBadRequest("Only POST method is allowed")
    if request.user.is_anonymous():
        return HttpResponseForbidden("Only authorized user allowed")

    playlist = PlayList.objects.create(author=request.user)

    return HttpResponse(json.dumps({
        "id": playlist.pk
    }))

def get_user_playlist(request, playlist_pk):
    if request.user.is_anonymous():
        return HttpResponseForbidden("Only authorized user allowed")

    playlist = UserPlayList.objects.get(user=request.user.pk, playlist=playlist_pk)

    return HttpResponse(json.dumps({
        "tracks": [serialize_playlist_item(item) for item in playlist.items.all()]
    }))