#!/usr/bin/env ruby
require 'socket'
require 'optparse'

REQUIRED_OPTIONS = [:host, :port, :path]
options =  {}
parser = OptionParser.new do |opts|
  opts.on('-h', '--host HOST') { |h| options[:host] = h }
  opts.on('-p', '--port PORT', Integer) { |p| options[:port] = p }
  opts.on('--path PATH') { |p| options[:path] = p }
  opts.on('--parameters param1=val1,param2=val2', Array) { |p| options[:parameters] = p }
end
parser.parse!

missing_options = REQUIRED_OPTIONS.select { |i| options[i].nil? }
unless missing_options.empty?
  STDERR.puts "Missing options: #{missing_options.map(&:to_s)}"
  puts parser
  exit
end

host = options[:host]
port = options[:port]
path = options[:path]
parameters = options[:parameters]

request =  "GET "
request << "/#{path}"
request << "?#{parameters.join('&')}" if parameters
request << " HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
puts response
socket.close
