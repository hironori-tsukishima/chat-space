class MessagesController < ApplicationController

  before_action :set_group

    def index
      @message = Message.new
      @messages = @group.messages.includes(:user)
    end

    def create
      @message = @group.messages.new(message_params)
      if @message.save
        redirect_to group_messages_path(@group), notice:"チャット成功！"
      else
        @messages = @group.messages.includes(:user)
        flash.now[:alert] = "送れてないよ。画像かテキストは入れてな"
        render :index
      end
    end

    def edit
    end

    def update
    end

    def message_params
      params.require(:message).permit(:image , :text).merge(user_id: current_user.id)
    end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
