require 'sinatra/async'

class AsyncTest < Sinatra::Base
  register Sinatra::Async

  def delay(secs)
    EM.add_timer(secs) { body { "delayed for #{secs} seconds\r\n" } }
  end

  aget '/delay/:n' do |n|
    delay(n.to_i)
  end

  aget '/test/cardserver' do
    delay(rand(2..5))
  end
end

run AsyncTest.new
