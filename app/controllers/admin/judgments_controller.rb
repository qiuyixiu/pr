class Admin::JudgmentsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @judgments = Judgment.all.page(params[:page]).per(15)
  end

  def new
    @judgment = Judgment.new
  end

  def edit
    @judgment = Judgment.find(params[:id])
  end

  def update
    @judgment = Judgment.find(params[:id])

    if @judgment.update(judgment_params)
      redirect_to admin_judgments_path
    else
      render :edit
    end
  end

  def create
    @judgment = Judgment.new(judgment_params)

    if @judgment.save
      redirect_to admin_judgments_path
    else
      render :new
    end
  end

  def destroy
    @judgment = Judgment.find(params[:id])
    @judgment.destroy
    redirect_to admin_judgments_path
  end

  private

  def judgment_params
    params.require(:judgment).permit(:title, :description, :image)
  end
end
