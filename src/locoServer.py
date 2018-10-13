__author__ = 'jmoriano'

from locoMail import app
from gevent.pywsgi import WSGIServer


http_server = WSGIServer(('', 5000), app)
http_server.log
http_server.serve_forever()