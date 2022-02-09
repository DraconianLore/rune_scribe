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
        # load structures and runes available to user, sort data to be more readable
        render :json => {
            runes: runes,
            structures: structures,
            tags: Tag.all.order(:id)
        }
    end

    def update_settings
        # load user
        @user = User.find(Current.user.id)
        # change settings as required
        @user.theme = params[:theme] if params[:theme]
        # For setting custom notifications
        @notification = params[:notification] || nil
        # For setting user house and follower
        @user.house = params[:house] if params[:house]
        @user.follower = params[:follower] if params[:follower]
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
            is_dm: Current.user.dungeonmaster,
            notification: @notification
        }
    end

    def update_rune
        rune = Rune.find(params[:id])
        # update tags
        rune.tag_ids = params[:tags] if params[:tags]
        # update TLDR
        rune.tldr = params[:tldr] if params[:tldr]
        if rune.save!
            send_general_update
            render :json => {
                message: 'Rune Updated - Updating Data'
            }
        end
    end
    
    def update_structure
        structure = Structure.find(params[:id])
        # update tags
        structure.tag_ids = params[:tags] if params[:tags]
        # update TLDR
        structure.tldr = params[:tldr] if params[:tldr]
        if structure.save!
            send_general_update
            render :json => {
                message: 'Rune Updated - Updating Data'
            }
        end
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

    def update_tag   
        tag = Tag.find(params[:id])
        tag.update(tag_params)
        if tag.save!
            send_general_update
            render :json => {
                message: 'Tag Updated - updating data'
            }
        end
    end

    def new_tag      
        tag = Tag.new(tag_params)
        if tag.save!
            send_general_update
            render :json => {
                message: 'Tag Created - updating data'
            }
        end
    end

    def delete_tag
        tag = Tag.find(params[:id])
        if tag.delete
            send_general_update
            render :json => {
                message: 'Tag Deleted - updating data'
            }
        end
    end

    def fav_structure
        structure = Structure.find(params[:id])
        userId = params[:newUser].to_s
        change = nil
        if structure.fav_by.include?(userId)
            change = 'remove'
            structure.fav_by = structure.fav_by - [userId]
        else
            structure.fav_by.push(userId)
            change = 'add'
        end
        if structure.save! 
            render :json => {
                change: change
            }
        end
    end

    def fav_rune
        rune = Rune.find(params[:id])
        userId = params[:newUser].to_s
        change = nil
        if rune.fav_by.include?(userId)
            change = 'remove'
            rune.fav_by = rune.fav_by - [userId]
        else
            rune.fav_by.push(userId)
            change = 'add'
        end
        if rune.save! 
            render :json => {
                change: change
            }
        end
    end

    private

    def load_runes
        # load and organize runes
        house = Current.user.house
        userlevel = Current.user.level
        house_level = {1 => 1, 2 => 3, 3 => 4, 4 => 5, 5 => 7, 6 => 7, 7 => 10}
        runes = Rune.where("level <= ?", userlevel).or(Rune.where("level <= ? AND house = ?", house_level[userlevel], house)).order(:id)

        runes
    end
    
    def load_structures
        # load and organize structures
        house = Current.user.house
        userlevel = Current.user.level
        complexity = {
            1 => 1,
            2 => 1,
            3 => 2,
            4 => 2,
            5 => 2,
            6 => 4,
            7 => 4,
            9 => 4,
            9 => 4,
            10 => 8,
            11 => 8,
            12 => 8,
            13 => 8,
            14 => 16,
            15 => 16,
            16 => 16,
            17 => 32,
            18 => 32,
            19 => 64,
            20 => 128
        }
        house_level = {1 => 1, 2 => 3, 3 => 4, 4 => 5, 5 => 7, 6 => 7, 7 => 10}
        structures = Structure.unlocked.joins(:level).where("levels.all <= ?", userlevel).or(Structure.unlocked.joins(:level).where("levels.all <= ? AND dominant = ?", house_level[userlevel], house)).where('number_of_runes <= ?', complexity[userlevel]).order(:id)
        
        structures
    end

    def tag_params
        params.require(:tag).permit(:name, :colour, :background)
    end

    def send_general_update
        ActionCable.server.broadcast(
            'updates', 
            message: 'structures'
        )
    end


  end
  