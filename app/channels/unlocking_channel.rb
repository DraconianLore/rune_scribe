class UnlockingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "unlocking"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
