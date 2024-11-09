module Api
  class BuddhistSitesController < ApplicationController
    def index
      @sites = BuddhistSite.all
      render json: @sites
    end
  end
end