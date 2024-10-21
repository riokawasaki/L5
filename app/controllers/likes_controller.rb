class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: session[:login_uid])
        user.like_tweets << tweet
        redirect_to root_path
    end
    def destroy
        t = Tweet.find(params[:id])
        u = User.find_by(uid: session[:login_uid])
        t.likes.find_by(user_id: u.id).destroy
        redirect_to top_path
    end
end