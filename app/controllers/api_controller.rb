class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_user_data
        render :json => {
            id: Current.user.id,
            name: Current.user.character,
            house: Current.user.house,
            level: Current.user.level,
            theme: Current.user.theme,
            is_dm: Current.user.dungeonmaster
        }
    end

    def get_structures

        runes = load_runes
        structures = load_structures
        # load structures and runes available to user
        # sort data to be more readable
                
        render :json => {
            runes: runes,
            structures: structures
        }
    end

    def update_settings
        # load user
        @user = User.find(Current.user.id)
        # change settings as required
        @user.theme = params[:theme] if params[:theme]

        # save user and set current
        if @user.save
            Current.user = @user
        end    

        # return user data
        render :json => {
            id: Current.user.id,
            name: Current.user.character,
            house: Current.user.house,
            level: Current.user.level,
            theme: Current.user.theme,
            is_dm: Current.user.dungeonmaster
        }
    end

    private

    def load_runes
        # load and organize runes
        Rune.all
    end
    def load_structures
        # load and organize structures
        Structure.all
    end


  end
  