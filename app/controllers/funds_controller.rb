class FundsController < ApplicationController
  def index
    @funds = Fund.all.page(params[:page]).per(15)
  end

  def show
    @fund = Fund.find(params[:id])
  end
end
