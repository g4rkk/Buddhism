class MessagesController < ApplicationController
  before_action :set_conversation
  before_action :set_buddhist_site

  def create
    Rails.logger.info "MessagesController#create called at #{Time.current}"
    Rails.logger.debug "Received params: #{params.inspect}"
    
    # 防止重复提交的简单检查
    cache_key = "message_creation_#{current_user.id}_#{Time.current.to_i}"
    return render json: { status: 'duplicate' }, status: :ok if Rails.cache.read(cache_key)
    
    Rails.cache.write(cache_key, true, expires_in: 2.seconds)
    
    @message = @conversation.messages.new(message_params)
    @message.sender = current_user
  
    if @message.save
      Rails.logger.info "Message saved successfully"
      begin
        rendered_message = render_message(@message)
        ActionCable.server.broadcast(
          "conversation_channel_#{@conversation.id}",
          {
            html: rendered_message,
            message: @message.as_json(include: { sender: { only: [:id, :username] } })
          }
        )
  
        # 统一响应格式
        respond_to do |format|
          format.json { render json: { status: 'success' }, status: :ok }
          format.html { head :ok }
          format.js { head :ok }
        end
      rescue => e
        Rails.logger.error "Broadcasting error: #{e.message}"
        render json: { error: 'Message saved but broadcast failed' }, status: :internal_server_error
      end
    else
      Rails.logger.error "Message save failed: #{@message.errors.full_messages}"
      render json: { error: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error "Conversation not found: #{e.message}"
    render json: { error: 'Conversation not found' }, status: :not_found
  end

  def set_buddhist_site
    @buddhist_site = BuddhistSite.find(params[:buddhist_site_id])
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error "Buddhist site not found: #{e.message}"
    render json: { error: 'Buddhist site not found' }, status: :not_found
  end

  def message_params
    params.permit(:content)
  end

  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: { 
        message: message,
        current_user: message.sender
      }
    )
  end
end