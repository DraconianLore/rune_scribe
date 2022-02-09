class RegistrationsController < ApplicationController
    # instantiates new user
    def new
      @user = User.new
    end
    def create
        @user = User.new(user_params)
        @user.level = 7 if ['Virdi','Virdi Caiman'].include? @user.character
        @user.level = 7 if ['Belmin', 'Belmin Internus'].include? @user.character
        @user.level = 2 if ['Charlotte', 'Charlotte Foe Wayne'].include? @user.character
        if @user.save
          # WelcomeMailer.with(user: @user).welcome_email.deliver_now
          # deliver_now is provided by ActiveJob.
          session[:user_id] = @user.id
          cookies.signed[:user_id] = @user.id
          redirect_to root_path
        else
          notice = 'An unknown error occurred'
          notice = 'A character with that name already exists' if User.find_by character: @user.character
          notice = 'Email already in use' if User.find_by email: @user.email
          flash[:alert] = notice
          render :new
        end
    end
    private
    def user_params
      # strong parameters
      params.require(:user).permit(:character, :email, :password, :password_confirmation)
    end
  end