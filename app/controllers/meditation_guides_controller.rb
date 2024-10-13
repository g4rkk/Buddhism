class MeditationGuidesController < ApplicationController
  before_action :authenticate_user!

  def index
    @meditation_guides = MeditationGuide.all
  end

  def new
    @meditation_guide = MeditationGuide.new
  end

  def create
    @meditation_guide = current_user.meditation_guides.build(meditation_guide_params)
    
    if @meditation_guide.save
      redirect_to @meditation_guide, notice: '瞑想ガイドが正常に作成されました。'
    else
      render :new
    end
  end

  private

  def meditation_guide_params
    params.require(:meditation_guide).permit(:title, :description, :audio)
  end
end
