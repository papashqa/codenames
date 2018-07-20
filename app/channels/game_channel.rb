class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "channel5"
  end

  def unsubscribed
    stop_all_streams 
  end

  def click(msg)
    ActionCable.server.broadcast(
      "channel5",
      clicked: msg['word']
    )
  end
end
