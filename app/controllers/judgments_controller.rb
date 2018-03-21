class JudgmentsController < ApplicationController
  def index
    @judgments = Judgment.all.page(params[:page]).per(15)
  end

  def show
    @judgment = Judgment.find(params[:id])
  end
end
