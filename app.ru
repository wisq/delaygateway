require 'sinatra/async'

class AsyncTest < Sinatra::Base
  register Sinatra::Async

  aget '/delay/:n' do |n|
    EM.add_timer(n.to_i) { body { "delayed for #{n} seconds\r\n" } }
  end
end

run AsyncTest.new
