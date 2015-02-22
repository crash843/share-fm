# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('player', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='playlist',
            name='slug',
        ),
        migrations.AlterField(
            model_name='playlist',
            name='last_processed_pl',
            field=models.ForeignKey(blank=True, to='player.UserPlayList', null=True),
            preserve_default=True,
        ),
    ]
