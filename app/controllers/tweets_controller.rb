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

  get "/tweets/new" do
    erb :"tweets/new"
  end

  post "/tweets" do 
    @tweet=Tweet.create({content:@params[:tweet][:content]})
    if @tweet.valid? 
      redirect "/tweets/#{@tweet.id}"
    end
  end

end
