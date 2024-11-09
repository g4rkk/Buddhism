# app/controllers/api/users_controller.rb
module Api
  class UsersController < ApplicationController
    def nearby
      latitude = params[:latitude]
      longitude = params[:longitude]
      distance = params[:distance] || 50

      if latitude.present? && longitude.present?
        @users = User.near([latitude, longitude], distance).where.not(id: current_user.id).includes(:tagged_buddhist_sites)
        render json: @users.to_json(include: { tagged_buddhist_sites: { only: [:id, :name] } })
      else
        render json: { error: '经纬度参数缺失' }, status: :unprocessable_entity
      end
    end
  end
end

