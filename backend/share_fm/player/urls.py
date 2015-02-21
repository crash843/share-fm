from django.conf.urls import patterns, url


urlpatterns = patterns('share_fm.player.views',
    url(r'^$', 'player_index', name='player_index'),
    # url(r'^$', 'player_detail', name='player_detail'),
    # url(r'player/create^$', 'player_create', name='player_create'),
)
