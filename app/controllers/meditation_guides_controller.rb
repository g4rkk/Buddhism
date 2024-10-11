class MeditationGuidesController < ApplicationController
  def index
    @meditation_guides = MeditationGuide.all
  end

  def show
    @meditation_guide = MeditationGuide.find(params[:id])
  end

  def new
    @meditation_guide = MeditationGuide.new
  end

  def create
    # 假设你从请求中获得了用户 ID，例如通过 params[:user_id]
    user = User.find(params[:user_id])  # 查找指定用户 ID
  
    # 使用找到的用户创建 meditation_guide
    @meditation_guide = user.meditation_guides.build(meditation_guide_params)
  
    if @meditation_guide.save
      redirect_to @meditation_guide, notice: 'Meditation guide was successfully created.'
    else
      render :new
    end
  end
  
  
  

  private

  def meditation_guide_params
    params.require(:meditation_guide).permit(:title, :description, :audio)
  end
end