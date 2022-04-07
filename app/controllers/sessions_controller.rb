class SessionsController < ApplicationController
    def new; end
    def create
      user = User.find_by(character: params[:character])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
        session[:user_id] = user.id
        cookies.signed[:user_id] = user.id
        Current.user = user
        redirect_to root_path
      else
        flash.now[:alert] = 'Invalid character or password'
        render :new
      end
    end

    def demo
      user = User.find_by(character: 'Demo Character')
      session[:user_id] = user.id
      cookies.signed[:user_id] = user.id
      Current.user = user
      redirect_to root_path
    end

    def destroy
      # deletes user session
      session[:user_id] = nil
      cookies.delete :user_id
      redirect_to root_path, notice: 'Logged Out'
    end
  end