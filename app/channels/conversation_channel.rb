# app/channels/conversation_channel.rb
class ConversationChannel < ApplicationCable::Channel
  def subscribed
    conversation_id = params[:conversation_id]
    if Conversation.exists?(conversation_id)
      Rails.logger.info "Subscribed to ConversationChannel ##{conversation_id}"
      stream_from "conversation_channel_#{conversation_id}"
    else
      reject
    end
  end
end
