class RoomsController < ApplicationController

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry_params)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries.where.not(user_id: current_user.id)
      # メッセージを送る相手のレコードを取得
      # @target = Entry.find_by(user_id: @room.user.id, room_id: @room.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end

end
