require 'sinatra/async'

class AsyncTest < Sinatra::Base
  register Sinatra::Async

  def delay(secs)
    EM.add_timer(secs) { body { "delayed for #{secs} seconds\r\n" } }
  end

  apost '/delay/:n' do |n|
    delay(n.to_i)
  end

  apost '/test/cardserver' do
    delay(rand(2..5))
  end
end

run AsyncTest.new
