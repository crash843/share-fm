from django.contrib import admin

from .models import PlayList, PlayListItem, UserPlayList, UserPlayListItem
from .models import Genre


class PlayListAdmin(admin.ModelAdmin):
    pass


class PlayListItemAdmin(admin.ModelAdmin):
    pass


class UserPlayListAdmin(admin.ModelAdmin):
    pass


class UserPlayListItemAdmin(admin.ModelAdmin):
    pass


class GenreAdmin(admin.ModelAdmin):
    pass


admin.site.register(PlayList, PlayListAdmin)
admin.site.register(PlayListItem, PlayListItemAdmin)
admin.site.register(UserPlayList, UserPlayListAdmin)
admin.site.register(UserPlayListItem, UserPlayListItemAdmin)
admin.site.register(Genre, GenreAdmin)
