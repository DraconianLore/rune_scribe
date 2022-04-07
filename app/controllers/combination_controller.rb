class CombinationController < ApplicationController

    def update_recent
        Combination.recently_discovered.each do |c|
            c.recent -= 1
            c.save
        end
    end

    def change_selected     # id - Combination being selected, user_id - user selecting combination
        combo = Combination.find(params[:id])
        user = User.find(params[:user_id])
        user.last_selected = combo.id
        user.save
        # send update to selected
    end

    def check_results
        update_recent   # Update old recents before unlocking
        combo = Combination.find(params[:id])
        combo.recent = 5 # Add to end of recent queue
        if combo.structure > 0
            combo.result = 'found'
        else
            combo.result = 'not found'
        end
        if combo.save!
            render :json => {
                mesage: "Success"
            }
        else
            render :json => {
                mesage: "Oops! An error occurred."
            }
        end
        
    end

end