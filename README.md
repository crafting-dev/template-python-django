# Python Django template for Cloud Sandbox

This is a Python [Django](https://www.djangoproject.com/) template, for quick development setup in Cloud Sandbox.

## Specifications

The following `App configuration` was used to create this template:

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
    - path: template-python-django
      repo:
        git: https://github.com/crafting-dev/template-python-django.git
    ports:
    - name: http
      port: 3000
      protocol: HTTP/TCP
```

### Creating the django app

To create the bare django app:

```bash
python3 -m django startproject mysite .
```

### Running the server

```bash
python3 manage.py runserver
```