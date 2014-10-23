require 'socket'
require 'openssl'

host = ARGV[-1]
port = 2103

socket = TCPSocket.open(host,port)
ssl_context = OpenSSL::SSL::SSLContext.new(:TLSv1)
ssl_context.cert = OpenSSL::X509::Certificate.new(File.open("server.crt"))
ssl_context.key = OpenSSL::PKey::RSA.new(File.open("server.key"))
ssl_context.set_params(verify_mode: OpenSSL::SSL::VERIFY_PEER)
ssl_socket = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)
ssl_socket.sync_close = true
ssl_socket.connect

ssl_socket.puts "Hello"
print ssl_context.gets

ssl_socket.close
