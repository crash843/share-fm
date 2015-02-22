from django.contrib.auth.models import AbstractUser

from social_auth.models import UserSocialAuth

from .exceptions import TokenError


class User(AbstractUser):
    def get_vk_access_token(self):
        try:
            user_oauth = UserSocialAuth.objects.get(user=self, provider='vk-oauth')
            try:
                return user_oauth.extra_data['access_token']
            except KeyError:
                raise TokenError('No access_token')
        except UserSocialAuth.DoesNotExist:
            raise TokenError('No user oauth')

    def get_vk_uid(self):
        try:
            return UserSocialAuth.objects.get(user=self, provider='vk-oauth').uid
        except UserSocialAuth.DoesNotExist:
            raise TokenError('No user oauth')