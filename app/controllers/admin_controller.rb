class AdminController < ApplicationController
    before_action :check_is_admin
    skip_before_action :verify_authenticity_token

    def index
        @page = params[:page] || 'players'
        @players = User.where(dungeonmaster: false)
        
        if @page == 'structures'
            @structures = load_structures
        end
    end

    def send_notification
        ActionCable.server.broadcast(
            'updates', 
            message: 'other',
            title: params[:title],
            body: params[:notification],
            refresh: params[:refresh]
        )
        redirect_to({ action: 'index', page: 'players'})
    end

    def unlock_structure
        structure = Structure.find(params[:id])
        structure.discovered = true
        if structure.save!
            ActionCable.server.broadcast(
                'updates', 
                message: 'new structure',
                structure: structure,
                runes: structure.runes
            )
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
        User.all.each do |user|
            user.level += 1 if user.level < 20
            results[user.character] = user.level
            user.save!
        end
        send_level_update
        render :json => results
    end

    private
    def check_is_admin
        Current.user.dungeonmaster
    end

    def load_structures
        structures = {
            unlocked: Structure.unlocked.order(:number_of_runes, :id),
            locked: Structure.locked.order(:number_of_runes, :id)
        }
        
        structures
    end

    def send_level_update
        ActionCable.server.broadcast(
            'updates', 
            message: 'level'
        )
    end
end
