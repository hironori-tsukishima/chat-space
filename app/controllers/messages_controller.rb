class MessagesController < ApplicationController

  before_action :set_group

    def index
      @message = Message.new
      @messages = @group.messages.includes(:user)

      respond_to do |format|
      format.html
      format.json{ @new_messages =  @messages.where('id > ?', params[:id])}

      end

    end

    def create
      @message = @group.messages.new(message_params)
      if @message.save
        respond_to do |format|
          format.html
          format.json
        end
      else
        flash.now[:alart] = "送れてないよ。画像かテキストは入れてな"
        render :index
      end
    end

    def edit
    end

    def update
    end

  private
  def message_params
    params.require(:message).permit(:image , :text).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
