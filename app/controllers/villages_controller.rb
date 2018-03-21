class VillagesController < ApplicationController
  def index
    @villages = Village.all.page(params[:page]).per(15)
  end

  def show
    @village = Village.find(params[:id])
  end
end
