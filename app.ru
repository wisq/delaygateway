require 'sinatra/async'

class AsyncTest < Sinatra::Base
  register Sinatra::Async

  def delay(secs)
    EM.add_timer(secs) { body { "delayed for #{"%.2f" % secs} seconds\r\n" } }
  end

  apost '/delay/:n' do |n|
    delay(n.to_f)
  end

  apost '/delay/:x/:y' do |x, y|
    delay(rand(x.to_f .. y.to_f))
  end

  apost '/test/cardserver' do
    delay(rand(2.0 .. 5.0))
  end
end

run AsyncTest.new
