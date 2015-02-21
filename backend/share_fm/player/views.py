from django.views.generic import TemplateView, DetailView


class PlayerIndex(TemplateView):
    template_name = 'player/index.html'

player_index = PlayerIndex.as_view()


class PlayerDetails(DetailView):
    pass

player_details = PlayerDetails.as_view()
