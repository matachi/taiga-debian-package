from .common import *

MEDIA_URL = "/media/"
STATIC_URL = "/static/"
# This should change if you want generate urls in emails
# for external dns.
SITES["front"]["domain"] = "localhost:8000"
DEBUG = True
PUBLIC_REGISTER_ENABLED = True
DEFAULT_FROM_EMAIL = "no-reply@example.com"
SERVER_EMAIL = DEFAULT_FROM_EMAIL
