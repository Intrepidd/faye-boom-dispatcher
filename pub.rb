require 'rubygems'
require 'bundler/setup'

require 'faye'

EM.run do
  client = Faye::Client.new('http://127.0.0.1:1111/faye')

  client.publish('/foo', {hello: :world}).callback { EM.stop }
end


