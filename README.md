# redis_pub_sub
This is a small demo app that demonstrates use of redis pub/sub.
Tutorial taken from here: https://thoughtbot.com/blog/redis-pub-sub-how-does-it-work

# how to run

0. Install redis locally:
  - download here: https://redis.io/download
  - unzip the folder and navigate to the folder using terminal
  - run `$make install` (or read the README.md in the folder where you'll find the same directions)
1. In a new terminal window run redis-server: `redis-server`
2. In a new terminal window run pub.rb to begin publishing messages to a channel (below is channel: rubyonrails, user: smartguy).
`$ruby lib/pub.rb rubyonrails smartguy`. This script is an infinite loop and allows you keep publishing messages to the channel
3. To monitor the channel, open a new terminal window, and type: `redis-cli`, at the redis prompt, enter `MONITOR`.  like below:
```
% redis-cli
redis> MONITOR
OK
1306462616.036890 "MONITOR"
1306462620.482914 "publish" "rubyonrails" "{\"user\":\"qrush\",\"msg\":\"Hello world\"}"
```
on your pub.rb terminal tab, type another message and you should see the message reflect in your 'MONITOR' terminal window tab
4. Open a fourth terminal window to create a subscriber (that will subscribe to the rubyonrails channel):
`$ruby lib/sub.rb`.  This will open up a listener on the channel, and any messages published to that channel will reflect here.