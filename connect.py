import socket
import ssl
import sys
import pprint

context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
context.verify_mode = ssl.CERT_REQUIRED
context.check_hostname = True
context.load_default_certs()
context.load_verify_locations(cafile='ca.crt')

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ssl_sock = context.wrap_socket(s, server_hostname="tls_drama")
ssl_sock.connect((sys.argv[-1], 2103))
cert = ssl_sock.getpeercert()
pprint.pprint(cert)
ssl_sock.sendall(b'Hello')
print(ssl_sock.recv(1024))
