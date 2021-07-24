class CommunitiesController < ApplicationController
  def index
    @communities = Community.where.not(user_id: current_user.id)
    @join_communities = Community.where(user_id: current_user.id)
  end

  def show
    @community = Community.find_by(id: params[:id])
    @community_comment = CommunityComment.new
    @community_comments = @community.community_comments.includes(:user)
    if !@community.users.include?(current_user)
      @community.users << current_user
    end

    # @groupposts = Grouppost.where(group_id: @group.id).all
  end

  def new
    @community = Community.new
    @community.users << current_user
  end

  def create
    @community = Community.new(community_params)
    @community.user_id = current_user.id
    if @community.save
      redirect_to communities_path, notice: 'コミュニテイを作成しました'
    else
      render :new
    end
  end

  private
  def community_params
    params.require(:community).permit(:community_title, :community_icon, user_ids: [] )
  end


end
