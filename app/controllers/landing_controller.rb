class LandingController < ApplicationController
  def index
    redirect_to app_url if Current.user
  end
  
end
