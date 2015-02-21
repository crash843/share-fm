from django.conf.urls import patterns, url


urlpatterns = patterns('share_fm.play.views',
    url(r'^$', 'player_index', name='player_index'),
    url(r'^$', 'player_detail', name='player_detail'),
)
