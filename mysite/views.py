from django.http import JsonResponse
from django.utils import timezone


def ping(request):
    ping = request.GET.get('ping')
    if ping == "":
        ping = 'To ping, or not to ping; that is the question.'
    pong = {
        'ping': ping,
        'received_at': timezone.now()
    }

    return JsonResponse(pong)
