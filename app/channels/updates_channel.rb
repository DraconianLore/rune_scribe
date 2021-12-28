class UpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "updates_channel"
    puts '#############################'
    puts "WS connected to user: #{current_user.character}"
    puts '#############################'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def char_level_up(char = current_user.character)
    character = User.find_by(character: char)
    char.level_up
  end

  def new_structure(structure)
    # add structure to all rune scribees who have the level requirements met
    
  end

  def update_settings(data)
    # update settings like themes here
  end

end
