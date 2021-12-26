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
end
