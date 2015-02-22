from django.conf.urls import patterns, url


urlpatterns = patterns('share_fm.player.views',
    url(r'^$', 'player_index', name='player_index'),
    url(r'^api/create_playlist/', 'create_playlist', name='player_api_create_playlist'),
    url(r'^api/get_playlist/(\d+)/$', 'get_playlist', name='player_api_get_playlist'),
    url(r'^api/get_user_playlist/(\d+)/$', 'get_user_playlist', name='player_api_get_user_playlist'),
    # url(r'^$', 'player_detail', name='player_detail'),
    # url(r'player/create^$', 'player_create', name='player_create'),
)
