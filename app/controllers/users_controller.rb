class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
   @user=User.new 
  end
  
  def create
    #文字列.include?(検索文字列)
    user_pass = BCrypt::Password.create(params[:user][:pass])
    if User.exists?(uid: params[:user][:uid])
      render 'error',status: 422
    else
      user = User.new(uid: params[:user][:uid], pass: user_pass)
      user.save
      #redirect_to '/'
      redirect_to top_main_path
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/'
  end
end
