# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('player', '0002_auto_20150221_2333'),
    ]

    operations = [
        migrations.AddField(
            model_name='playlistitem',
            name='playlist',
            field=models.ForeignKey(related_name='items', default=1, to='player.PlayList'),
            preserve_default=False,
        ),
    ]
