class Admin::EffectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @effects = Effect.all.page(params[:page]).per(15)
  end

  def new
    @effect = Effect.new
  end

  def edit
    @effect = Effect.find(params[:id])
  end

  def update
    @effect = Effect.find(params[:id])

    if @effect.update(effect_params)
      redirect_to admin_effects_path
    else
      render :edit
    end
  end

  def create
    @effect = Effect.new(effect_params)

    if @effect.save
      redirect_to admin_effects_path
    else
      render :new
    end
  end

  private

  def effect_params
    params.require(:effect).permit(:title, :description, :image)
  end
end
