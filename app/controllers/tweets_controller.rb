class TweetsController < ApplicationController

  get "/tweets" do
    if logged_in?
      @tweets=Tweet.all
      #binding.pry
      erb :"tweets/tweets"
    else
      redirect "/login"
    end
  end

end
