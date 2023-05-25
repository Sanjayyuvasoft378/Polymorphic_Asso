class PicturesController < ApplicationController
  before_action :current_pic, only: [:show, :edit, :destroy, :update]
  def index
    @pics = Picture.all
  end
  def show
  end
  def new
    @pic = Picture.new
  end
  def create 
    @pic = Picture.new(pic_params)
    if @pic.save
      redirect_to @pic
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @pic.update(pic_params)
      redirect_to @pic
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @pic.destroy
    redirect_to pictures_path
  end
  def pic_params
    params.require(:picture).permit(:name, :imageable_type, :imageable_id)
  end
  def current_pic
    @pic = Picture.find(params[:id])
  end
end
