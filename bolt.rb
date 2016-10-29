#!/usr/bin/env ruby
require 'socket'
require 'optparse'

host = 'localhost'
port = 8000
message = 'foo'

request = "GET /echo.php?message=#{message} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
puts response
socket.close
