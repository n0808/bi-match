class HairdressersController < ApplicationController

  def index
    @hairdressers = Hairdresser.includes(:images).order('created_at DESC').limit(5)
  end
  
  def new
    @hairdresser = Hairdresser.new
    @hairdresser.images.build
  end

  def create
    @hairdresser = Hairdresser.create!(hairdresser_params)
    if @hairdresser.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def hairdresser_params
    params.require(:hairdresser).permit(:name, :price, :explain, :area, :prefecture_id, :gender_id, :technique_id, :history_id, images_attributes: [:src, :_destroy, :id])
  end
end
