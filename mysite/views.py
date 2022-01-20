from django.http import JsonResponse

from datetime import datetime

def ping(request):
  ping = request.GET.get('ping')
  if ping == "":
    ping = 'To ping, or not to ping; that is the question.'
  pong = {
    'ping': ping,
    'received_at': datetime.utcnow()
  }

  return JsonResponse(pong)
