class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        @user.reset_session_token!
        session[:session_token] = nil
        redirect_to user_url(params[:user])
    end
end