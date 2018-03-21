class EffectsController < ApplicationController
  def index
    @effects = Effect.all.page(params[:page]).per(15)
  end

  def show
    @effect = Effect.find(params[:id])
  end
end
