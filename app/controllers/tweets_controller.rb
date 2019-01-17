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

  get "/tweets/:id/edit" do
    if logged_in? 
      @tweet=Tweet.find_by_id(@params[:id])

      if current_user.tweets.include?(@tweet)
        erb :"tweets/edit_tweet"
      end
    end
  
  end

  get "/tweets/:id" do
    if logged_in?
      @tweet=Tweet.find_by_id(@params[:id])
      erb :"tweets/show_tweet"
    else
      redirect "/login"
    end

  end

  post "/tweets" do
    #binding.pry
    @tweet=Tweet.create({content:@params[:tweet][:content]})
    binding.pry
    if @tweet.valid?
      current_user.tweets << @tweet
      redirect "/tweets/#{@tweet.id}"
    else
      redirect "/tweets/new"
    end
  end

end
