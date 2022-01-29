class AdminController < ApplicationController
    before_action :check_is_admin

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
            body: params[:notification]
        )
        redirect_to({ action: 'index', page: 'players'})
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
end
