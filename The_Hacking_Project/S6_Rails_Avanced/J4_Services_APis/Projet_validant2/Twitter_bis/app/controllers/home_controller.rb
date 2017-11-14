class HomeController < ApplicationController
  def index
	@sendtweet = send_a_tweet("ok")
  end

 private

  def send_a_tweet message
	SendTweet.new(message)
  end

end
