# require 'rubygems' unless defined?(Gem)
require "millibot/version"
require "growl"
# require 'bundler'
# require 'pry'
# Bundler.require(:default) unless defined?(Bundler)
require 'chatterbot'

# 144995096931209219
# 144995413294977024
# 144996403276550144
# 144996692817739777

# :chatterbot_config: mysql://localhost/cf_tweet_bot?user=root

module Millibot
  extend self
  
  # require 'chatterbot/dsl'

  def start!
    puts "Polling ... #{Time.now}"
    
    bot = Chatterbot::Bot.new(:name => "Cloudfactory Bot")
    
    # ENV["chatterbot_db"]
    # ENV["chatterbot_config"]
    
    bot.search("'millisami'") do |tweet|
    
      # $stdout.puts tweet.inspect
      # binding.pry
    
      bot.retweet(tweet[:id])
      notify('Retweet', tweet.inspect, false)
    end
    
    # explicitly update our config
    bot.update_config
  end
  alias :run :start!
 
  def notify(title, text, sticky=true)
    Growl.notify(text, :title => title, :icon => File.expand_path("../../images/icon.png", __FILE__), :sticky => sticky); sleep 0.2
    puts "=> #{title}: #{text}"
  end
 
end
  
  # puts "checking for replies to me"
  # replies do |tweet|
  #   # replace the incoming username with the handle of the user who tweeted us
  #   src = tweet[:text].gsub(/@echoes_bot/, tweet_user(tweet))
  # 
  #   # replace the incoming username with #USER#, which will be replaced
  #   # with the handle of the user who tweeted us by the
  #   # replace_variables helper
  #   # src = tweet[:text].gsub(/@echoes_bot/, "#USER#")  
  # 
  #   # send it back!
  #   reply src, tweet
  # end


# bot = Chatterbot::Bot.new
# bot.search("'surely you must be joking'") do |tweet|
#  bot.reply "@#{tweet_user(tweet)} I am serious, and don't call me Shirley!", tweet
# end