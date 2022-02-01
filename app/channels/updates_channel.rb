class UpdatesChannel < ApplicationCable::Channel

  def subscribed
    current_user.connected = true
    current_user.save
    stream_from "updates"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.connected = false
    current_user.save
  end

end
