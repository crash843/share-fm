# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('player', '0003_playlistitem_playlist'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userplaylistitem',
            name='pl_item',
        ),
        migrations.AddField(
            model_name='userplaylist',
            name='playlist',
            field=models.ForeignKey(related_name='+', default=1, to='player.PlayList'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='artist',
            field=models.CharField(max_length=512, null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='duration',
            field=models.PositiveSmallIntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='genre',
            field=models.ForeignKey(default=1, to='player.Genre'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='title',
            field=models.CharField(max_length=512, null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='vk_album_id',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='vk_audio_id',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='vk_lyrics_id',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='userplaylistitem',
            name='vk_mp3_url',
            field=models.CharField(default='', max_length=b'2000'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='playlist',
            name='last_processed_pl',
            field=models.ForeignKey(related_name='+', blank=True, to='player.UserPlayList', null=True),
            preserve_default=True,
        ),
    ]
