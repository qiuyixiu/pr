class Admin::FundsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @funds = Fund.all.page(params[:page]).per(15)
  end

  def new
    @fund = Fund.new
  end

  def edit
    @fund = Fund.find(params[:id])
  end

  def update
    @fund = Fund.find(params[:id])

    if @fund.update(fund_params)
      redirect_to admin_funds_path
    else
      render :edit
    end
  end

  def create
    @fund = Fund.new(fund_params)

    if @fund.save
      redirect_to admin_funds_path
    else
      render :new
    end
  end

  private

  def fund_params
    params.require(:fund).permit(:title, :description, :image)
  end
end
