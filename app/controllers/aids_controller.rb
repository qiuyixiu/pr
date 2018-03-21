class AidsController < ApplicationController
  def index
    @aids = Aid.all.page(params[:page]).per(15)
  end

  def show
    @aid = Aid.find(params[:id])
  end
end
