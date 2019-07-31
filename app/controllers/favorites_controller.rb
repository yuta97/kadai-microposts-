class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    # favorite = Favorite.new(user_id: current_user.id, micropost_id: params[:micropost_id])
    # favorite.save
    flash[:success] = "お気に入りにしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = "お気に入りを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
end
