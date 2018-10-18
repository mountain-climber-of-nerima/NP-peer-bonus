class MessagesController < ApplicationController
  before_action :authenticate_user

  require 'net/http'
  require 'uri'
  require 'openssl'

  def new
    @message = Message.new
    @users = User.all
  end

  def create
    @receive = User.find_by(id: params[:receive_id].to_i)
    if @receive
    @message = Message.new(
      receive_id: params[:receive_id].to_i,
      receive_user_name: @receive.name,
      send_id: @current_user.id,
      send_user_name: @current_user.name,
      anonymous_flag: params[:anonymous_flag],
      message_theme: params[:theme],
      message_content: params[:content]
    )
    if @message.save
      flash[:notice] = "メッセージを送信しました"
      redirect_to("/messages/complete")

      uri = URI.parse("https://api.chatwork.com/v2/rooms/126021530/messages")
      request = Net::HTTP::Post.new(uri)
      request["X-Chatworktoken"] = "a6cbd861e2b46de8b90473a4c029d613"
      request.set_form_data(
        "body" => "
        #{@receive.name}さんに感謝メッセージが届きました！
        ",
        "self_unread" => "0",
      )
      req_options = {
        use_ssl: uri.scheme == "https",
        verify_mode: OpenSSL::SSL::VERIFY_NONE,
      }
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    else
      render("home/top")
    end
    else
      flash[:notice] = "選択肢を入力してください"
      redirect_to("/messages/new")
    end
    end

  def sample_show
  end

  def complete
  end

  def inbox_index
    @message = Message.where(receive_id: @current_user.id)
    @inbox = @message.all.order(created_at: :desc)
  end

  def inbox_show_1
    @message = Message.find_by(id: params[:id])
  end

  def inbox_show_2
    @message = Message.find_by(id: params[:id])
  end

  def inbox_show_3
    @message = Message.find_by(id: params[:id])
  end

  def sent_index
    @sent = Message.where(send_id: @current_user.id)
  end

  def sent_show_1
    @message = Message.find_by(id: params[:id])
  end

  def sent_show_2
    @message = Message.find_by(id: params[:id])
  end

  def sent_show_3
    @message = Message.find_by(id: params[:id])
  end

  def edit
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.destroy
    flash[:notice] = "送信したメッセージを削除しました"
    redirect_to("/messages/#{@current_user.id}/sent_index")
  end

  def update
  end

  def reply_new
    @receive_message = Message.find_by(id: params[:id])
    @reply_message = Message.new
  end

  def reply_create
    @receive_message = Message.find_by(id: params[:id])
    @message = Message.new(
      receive_id: @receive_message.send_id,
      receive_user_name: @receive_message.send_user_name,
      send_id: @current_user.id,
      send_user_name: @current_user.name,
      message_theme: params[:theme],
      stamp: params[:stamp],
      message_content: params[:content],
      parent: @receive_message.id
    )
    if @message.save
      flash[:notice] = "メッセージを送信しました"
      redirect_to("/messages/complete")
    else
      render("messages/new")
    end
  end

  def reply_update
  end

end
