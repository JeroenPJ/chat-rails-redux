class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    render json: @channel.messages.map(&:to_api)
  end

  def create
    message = Message.new(message_params.merge(channel: @channel, user: current_user))
    if message.save
      render json: message.to_api
    else
      render json: { status: 500, error: message.errors.messages } # error
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_channel
    @channel = Channel.find_by_name(params[:channel_id])
  end
end
