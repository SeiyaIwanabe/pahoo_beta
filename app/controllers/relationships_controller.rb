class RelationshipsController < ApplicationController

  def create
    send = current_user.active_relationships.build(recipient_id: params[:user_id])
    send.save
  end

  def destroy
    send = current_user.active_relationships.find_by(recipient_id: params[:user_id])
    send.destroy
  end

end