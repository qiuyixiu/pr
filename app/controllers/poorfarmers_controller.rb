class PoorfarmersController < ApplicationController
  def index
    @poorfarmers = Poorfarmer.all.page(params[:page]).per(15)
  end

  def show
    @poorfarmer = Poorfarmer.find(params[:id])
  end
end
