from django.http import JsonResponse

from datetime import datetime

def ping(request):
  pong = {
    'ping': request.GET.get('ping', 'To ping, or not to ping; that is the question.'),
    'received_at': datetime.utcnow()
  }

  return JsonResponse(pong)
