class Admin::VillagesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @villages = Village.all.page(params[:page]).per(15)
  end

  def new
    @village = Village.new
  end

  def edit
    @village = Village.find(params[:id])
  end

  def update
    @village = Village.find(params[:id])

    if @village.update(village_params)
      redirect_to admin_villages_path
    else
      render :edit
    end
  end

  def create
    @village = Village.new(village_params)

    if @village.save
      redirect_to admin_villages_path
    else
      render :new
    end
  end

  private

  def village_params
    params.require(:village).permit(:title, :description, :image)
  end
end
