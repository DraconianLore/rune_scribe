class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_user_data
        render :json => {
            id: Current.user.id,
            name: Current.user.character,
            house: Current.user.house,
            level: Current.user.level,
            theme: Current.user.theme,
            follower: Current.user.follower,
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
            follower: Current.user.follower,
            is_dm: Current.user.dungeonmaster
        }
    end

    def unlock_structure
        structure = Structure.find(params[:id])
        structure.discovered = true
        if structure.save!
            # TODO: maybe broadcast refresh?
            render :json => {
                message: 'Unlocked'
            }
        else
            render :json => {
                mesage: "Oops! An error occurred."
            }
        end
    end

    def level_char
        char = User.find(params[:id])
        params[:direction] == 'up' ? char.level += 1 : char.level -= 1
        if char.save!
            render :json => {
                new_level: char.level,
                charId: char.id
            }
        else
            render :json => {
                error: 'failed to save'
            }
        end
        
    end

    def level_party
        results = {}
        party = Party.find(params[:party])
        User.all.each do |user|
            user.level += 1 if user.level < 20
            results[user.character] = user.level
            user.save!
        end
        render :json => results
    end

    def bonus_actions
        runes = load_runes
        
        bonus_action_list = nil
        if Current.user.level >= 7 
            bonus_action_list = runes.where("house = ?", Current.user.house).or(Rune.where("level <= ?", 2))
        elsif Current.user.level.between?(5, 6)
            bonus_action_list = runes.where("house = ?", Current.user.house)
        end
  
        render :json => {
            runes:  bonus_action_list
        }
    end

    private

    def load_runes
        # load and organize runes
        house = Current.user.house
        userlevel = Current.user.level
        house_level = {1 => 1, 2 => 3, 3 => 4, 4 => 5, 5 => 7, 6 => 7, 7 => 10}
        runes = Rune.where("level <= ?", userlevel).or(Rune.where("level <= ? AND house = ?", house_level[userlevel], house))

        runes
    end
    
    def load_structures
        # load and organize structures
        house = Current.user.house
        userlevel = Current.user.level
        house_level = {1 => 1, 2 => 3, 3 => 4, 4 => 5, 5 => 7, 6 => 7, 7 => 10}
        # work out how do have all that have house level and exclude ones with overlevelled other hosues
        # work out how to restrick levels to x rune structures
        all = Structure.joins(:level).where("levels.all <= ?", userlevel)
        # house = Structure.joins(:level).where("levels.#{house} <= ?", house_level[level])

    end


  end
  