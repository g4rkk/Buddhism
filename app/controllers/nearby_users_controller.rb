# app/controllers/nearby_users_controller.rb
class NearbyUsersController < ApplicationController
  def index
    if params[:buddhist_site_id].blank?
      redirect_to buddhist_sites_path, alert: "まず仏教施設を選択してください。"
      return
    end

    @buddhist_site = BuddhistSite.find(params[:buddhist_site_id])
    @tagged_users = @buddhist_site.tagged_users.where.not(id: current_user.id)
  end
end

