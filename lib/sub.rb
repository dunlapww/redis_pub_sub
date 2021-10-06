require 'redis'
require 'json'
require 'pry'

#timeout: 0 should meet it never times out, however that was failing so changed it to another number and now it works
#$redis = Redis.new(timeout: 0)

#actually just removed the timeout argument and it seems to work fine
$redis = Redis.new

#subscribe to two channels: rubyonrails, ruby-lang
$redis.subscribe('rubyonrails', 'ruby-lang') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "##{channel} - [#{data['user']}]: #{data['msg']}"
  end
end
