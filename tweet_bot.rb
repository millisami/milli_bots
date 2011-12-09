require 'rubygems'
require 'pry'
require 'bundler'
Bundler.require(:default)
require 'chatterbot'

# 144995096931209219
# 144995413294977024
# 144996403276550144
# 144996692817739777

# :chatterbot_config: mysql://localhost/cf_tweet_bot?user=root

require 'chatterbot/dsl'
loop do
  puts "Polling ... #{Time.now}"
  search("'millisami'") do |tweet|
    # here you could do something with a tweet
    $stdout.puts tweet.inspect
    # binding.pry
  end
  
  puts "checking for replies to me"
  replies do |tweet|
    # replace the incoming username with the handle of the user who tweeted us
    # src = tweet[:text].gsub(/@echoes_bot/, tweet_user(tweet))

    # replace the incoming username with #USER#, which will be replaced
    # with the handle of the user who tweeted us by the
    # replace_variables helper
    src = tweet[:text].gsub(/@echoes_bot/, "#USER#")  

    # send it back!
    reply src, tweet
  end

  # explicitly update our config
  update_config
  sleep 10
end


# bot = Chatterbot::Bot.new
# bot.search("'surely you must be joking'") do |tweet|
#  bot.reply "@#{tweet_user(tweet)} I am serious, and don't call me Shirley!", tweet
# end