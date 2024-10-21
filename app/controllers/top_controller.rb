require "bcrypt"
class TopController < ApplicationController
  def main
        if session[:login_uid] 
            @tweets = Tweet.all
            render "main"
        else
            render "login"
        end
  end
    def login
        #if params[:uid]=='kindai'and params[:pass]=='sanriko'
        #if BCrypt::Password.new(user.pass) == params[:pass]
        user=User.find_by(uid:params[:uid])
        if user and BCrypt::Password.new(user.pass) == params[:pass] 
            session[:login_uid]=params[:uid]
            redirect_to top_main_path
        else
            render 'error',status: 422
        end
    end
    def logout
        session.delete(:login_uid)
        redirect_to top_main_path
    end
    def new
       @tweet=Tweet.new 
    end
    def create
        t = Tweet.new(message: params[:tweet][:message])
        t.user=User.find_by(uid: session[:login_uid])
        t.save
        redirect_to top_main_path
        #top_main_path
    end
      def destroy
        t = Tweet.find(params[:id])
        t.destroy
        redirect_to top_main_path
      end
end
