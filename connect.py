import socket
import ssl
import sys

context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
context.verify_mode = ssl.CERT_REQUIRED
context.check_hostname = False
context.load_default_certs()
context.load_verify_locations(cafile='server.crt')

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ssl_sock = context.wrap_socket(s)
ssl_sock.connect((sys.argv[-1], 2103))
