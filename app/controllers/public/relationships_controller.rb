class Public::RelationshipsController < ApplicationController

  def create
    relationship = Relationship.create(followed_id: params[:user_id])
    relationship.follower_id = current_user.id
    relationship.save
    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.find_by(followed_id: params[:user_id], follower_id: current_user.id)
    relationship.destroy
    redirect_to request.referer
  end

#フォロー一覧、フォロワー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end


end
