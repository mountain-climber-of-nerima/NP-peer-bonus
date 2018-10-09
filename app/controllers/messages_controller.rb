class MessagesController < ApplicationController
  before_action :authenticate_user

  def new
    @message = Message.new
  end

  def create
    @receive = User.find_by(id: params[:receive_id])
    @message = Message.new(
      receive_id: params[:receive_id],
      receive_user_name: @receive.name,
      anonymous_flag: params[:send_user],
      send_id: @current_user.id,
      send_user_name: @current_user.name,
      message_theme: params[:theme],
      stamp: params[:stamp],
      message_content: params[:content]
    )
    if @message.save
    flash[:notice] = "メッセージを送信しました"
    redirect_to("/messages/complete")
  else
    render("messages/new")
  end
  end

  def sample_show
  end

  def complete
  end

  def inbox_index
    @inbox = Message.where(receive_id: @current_user.id)
  end

  def inbox_show_1
  end

  def inbox_show_2
  end

  def inbox_show_3
  end

  def sent_index
    @sent = Message.where(send_id: @current_user.id)
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
