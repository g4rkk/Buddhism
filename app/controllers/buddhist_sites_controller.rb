# app/controllers/buddhist_sites_controller.rb
require 'net/http'
require 'json'

class BuddhistSitesController < ApplicationController
  before_action :authenticate_user!, only: [:tag_site]

  def tag_site
    @buddhist_site = BuddhistSite.find(params[:id])
    if current_user.tagged_buddhist_sites.include?(@buddhist_site)
      redirect_to buddhist_sites_path, notice: 'この寺院はすでにマーク済みです。'
    else
      current_user.tagged_buddhist_sites << @buddhist_site
      redirect_to buddhist_sites_path, notice: 'この寺院を正常にマークしました！'
    end
  end

  def index
    @buddhist_sites = BuddhistSite.all
  end

  def show
    @buddhist_site = BuddhistSite.find(params[:id])
  end

  def fetch_buddhist_sites
    latitude = params[:latitude] || 35.6762  # 东京默认坐标
    longitude = params[:longitude] || 139.6503
    radius = params[:radius] || 5000
    
    # 创建多个关键词组合
    keywords = ["寺", "temple", "お寺", "寺院", "Buddhist temple"]
    all_results = []
    
    keywords.each do |keyword|
      url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=#{radius}&type=place_of_worship&keyword=#{URI.encode_www_form_component(keyword)}&language=ja&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
      
      response = Net::HTTP.get_response(URI(url))
      results = JSON.parse(response.body)
      
      if results["results"].present?
        all_results.concat(results["results"])
      end
      
      # 处理翻页结果
      while results["next_page_token"]
        sleep(2) # 需要短暂延迟，等待 next_page_token 生效
        
        next_url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken=#{results["next_page_token"]}&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
        response = Net::HTTP.get_response(URI(next_url))
        results = JSON.parse(response.body)
        
        all_results.concat(results["results"]) if results["results"].present?
      end
    end
    
    # 去重处理
    processed_places = {}
    
    all_results.each do |place|
      place_id = place["place_id"]
      next if processed_places[place_id]
      
      # 检查是否真的是寺庙（通过名称判断）
      name = place["name"]
      if is_buddhist_temple?(name)
        BuddhistSite.find_or_create_by(
          google_place_id: place_id,
          name: name,
          address: place["vicinity"],
          latitude: place["geometry"]["location"]["lat"],
          longitude: place["geometry"]["location"]["lng"]
        )
        processed_places[place_id] = true
      end
    end
  
    if processed_places.any?
      redirect_to buddhist_sites_path, notice: "已成功获取#{processed_places.size}个佛教场所信息！"
    else
      redirect_to buddhist_sites_path, alert: "未能获取佛教场所信息，请检查搜索条件。"
    end
  end
  
  private
  
  def is_buddhist_temple?(name)
    # 检查名称中是否包含寺庙相关关键词
    temple_keywords = %w[寺 temple Temple お寺 寺院 山 堂]
    excluded_keywords = %w[神社 shrine Shrine 大使館 Embassy]
    
    has_temple_keyword = temple_keywords.any? { |keyword| name.include?(keyword) }
    has_excluded_keyword = excluded_keywords.any? { |keyword| name.include?(keyword) }
    
    has_temple_keyword && !has_excluded_keyword
  end
end
