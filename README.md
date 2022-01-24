# Python/Django with MySQL template for Crafting Sandbox

This is a Python/[Django](https://www.djangoproject.com/) with MySQL template, configured for quick development setup in [Crafting Sandbox](https://docs.sandboxes.cloud/docs).

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
  ping = request.GET.get('ping')
  if ping == "":
    ping = 'To ping, or not to ping; that is the question.'
  pong = {
    'ping': ping,
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

## App Definition

The following [App Definition](https://docs.sandboxes.cloud/docs/app-definition) was used to create this template:

```yaml
endpoints:
- name: api
  http:
    routes:
    - pathPrefix: "/"
      backend:
        target: python-django
        port: api
    authProxy:
      disabled: true
workspaces:
- name: python-django
  description: Template backend using Python/Django
  ports:
  - name: api
    port: 3000
    protocol: HTTP/TCP
  checkouts:
  - path: backend
    repo:
      git: https://github.com/crafting-dev/template-python-django
dependencies:
- name: mysql
  serviceType: mysql
  version: '8'
  properties:
    database: superhero
    password: batman
    username: brucewayne
```
