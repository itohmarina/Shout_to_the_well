class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(group_message)
    GroupMessage.create(body: group_message['messagebody'], user_id: group_message['user'].to_i, group_id: group_message['group'].to_i)
    ActionCable.server.broadcast 'group_channel', messagebody: group_message['messagebody']
  end
end
