class PoliciesController < ApplicationController
  def index
    @policies = Policy.all.page(params[:page]).per(15)
  end

  def show
    @policy = Policy.find(params[:id])
  end
end
