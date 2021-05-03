class RelationshipsController < ApplicationController

  def create
    send = current_user.active_relationships.build(recipient_id: params[:user_id])
    send.save
    redirect_to root_path
  end

  def destroy
    send = current_user.active_relationships.find_by(recipient_id: params[:user_id])
    send.destroy
    redirect_to root_path
  end

end