class Admin::PoorfarmersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @poorfarmers = Poorfarmer.all.page(params[:page]).per(15)
  end

  def new
    @poorfarmer = Poorfarmer.new
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def edit
    @poorfarmer = Poorfarmer.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end



  def update
    @poorfarmer = Poorfarmer.find(params[:id])
    @poorfarmer.category_id = params[:category_id]

    if @poorfarmer.update(poorfarmer_params)
      redirect_to admin_poorfarmers_path
    else
      render :edit
    end
  end

  def create
    @poorfarmer = Poorfarmer.new(poorfarmer_params)
    @poorfarmer.category_id = params[:category_id]

    if @poorfarmer.save
      redirect_to admin_poorfarmers_path
    else
      render :new
    end
  end

  private

  def poorfarmer_params
    params.require(:poorfarmer).permit(:title, :description, :quantity, :image, :helper, :category, :category_id)
  end
end
