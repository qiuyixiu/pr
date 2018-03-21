class Admin::AidsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @aids = Aid.all.page(params[:page]).per(15)
  end

  def new
    @aid = Aid.new
  end

  def edit
    @aid = Aid.find(params[:id])
  end

  def update
    @aid = Aid.find(params[:id])

    if @aid.update(aid_params)
      redirect_to admin_aids_path
    else
      render :edit
    end
  end

  def create
    @aid = Aid.new(aid_params)

    if @aid.save
      redirect_to admin_aids_path
    else
      render :new
    end
  end

  private

  def aid_params
    params.require(:aid).permit(:title, :description, :image)
  end
end
