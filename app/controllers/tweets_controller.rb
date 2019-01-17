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

  get "/tweets/:id" do
    if logged_in
      @tweet=Tweet.find_by_id(@params[:id])
      erb :"tweets/show_tweet"
    else
      redirect "/login"
    end

  end

  post "/tweets" do
    @tweet=Tweet.create({content:@params[:tweet][:content]})
    if tweet.valid?
      current_user << @tweet
      redirect "/tweets/#{@tweet.id}"
    end
  end

end
