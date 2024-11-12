class ConversationsController < ApplicationController
  before_action :set_buddhist_site

  def create
    @user = current_user
    @conversation = Conversation.find_or_create_by(
      user: @user,
      buddhist_site: @buddhist_site
    )

    redirect_to buddhist_site_conversation_path(@buddhist_site, @conversation)
  end

  def show
    @conversation = @buddhist_site.conversations.find(params[:id])
    @messages = @conversation.messages.includes(:sender)
    @message = Message.new
  end  

  private

  def set_buddhist_site
    @buddhist_site = BuddhistSite.find(params[:buddhist_site_id])
  end
end