# Python/Django with MySQL template for Crafting Sandbox

This is a Python/[Django](https://www.djangoproject.com/) with MySQL template, configured for quick development setup in [Crafting Sandbox](https://crafting.readme.io/docs).

## Specifications

This template defines a single `/ping` [route](mysite/urls.py):
```python
urlpatterns = [
    path('ping', views.ping),
]
```

whose [view](mysite/views.py) is defined as:
```python
def ping(request):
  pong = {
    'ping': request.GET.get('ping', 'To ping, or not to ping; that is the question.'),
    'received_at': datetime.utcnow()
  }

  return JsonResponse(pong)
```

This action receives a query string, and responds with the param string and the current time. For example:
```bash
$ curl --request GET 'localhost:3000/ping?ping=hello'
{"ping": "hello", "received_at": "XXXX-XX-XXXXX:XX:XX.XXX"}
```

Template is configured with MySQL, and [`mysite/settings.py`](mysite/settings.py) contains the connection configuration.
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': environ.get('MYSQL_SERVICE_HOST'),
        'PORT': environ.get('MYSQL_SERVICE_PORT'),
        'NAME': 'XXX',
        'USER': 'XXX',
        'PASSWORD': 'XXX'
    }
}
```

To run the app:
```bash
python3 manage.py runserver 0.0.0.0:3000
```

## App configuration

The following [App configuration](https://crafting.readme.io/docs/app-spec) was used to create this template:

```yaml
endpoints:
- http:
  routes:
  - backend:
      port: http
      target: python-django
    path_prefix: /
name: app
services:
- description: Python/Django template
name: python-django
workspace:
  checkouts:
  - path: src/template-python-django
    repo:
      git: https://github.com/crafting-dev/template-python-django.git
  ports:
  - name: http
    port: 3000
    protocol: HTTP/TCP
- managed_service:
  properties:
    database: superhero
    password: batman
    username: brucewayne
  service_type: mysql
  version: "8"
name: mysql
```
