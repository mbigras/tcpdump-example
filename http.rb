require 'webrick'

server = WEBrick::HTTPServer.new :Port => 8000

server.mount_proc '/' do |req, res|
  res.body = 'hello world'
end

server.mount_proc '/secret' do |req, res|
  res.body = 'secret password'
end

trap 'INT' do
  server.shutdown
end

server.start
