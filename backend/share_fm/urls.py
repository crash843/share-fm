from django.conf.urls import patterns, include, url
from django.contrib import admin


urlpatterns = patterns('',
    url(r'^$', include('share_fm.player.urls')),

    url(r'', include('social_auth.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
