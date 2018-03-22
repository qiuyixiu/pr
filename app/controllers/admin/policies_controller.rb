class Admin::PoliciesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @policies = Policy.all.page(params[:page]).per(15)
  end

  def new
    @policy = Policy.new
  end

  def edit
    @policy = Policy.find(params[:id])
  end

  def update
    @policy = Policy.find(params[:id])

    if @policy.update(policy_params)
      redirect_to admin_policies_path
    else
      render :edit
    end
  end

  def create
    @policy = Policy.new(policy_params)

    if @policy.save
      redirect_to admin_policies_path
    else
      render :new
    end
  end

  def destroy
    @policy = Policy.find(params[:id])
    @policy.destroy
    redirect_to admin_policies_path
  end

  private

  def policy_params
    params.require(:policy).permit(:title, :description, :image)
  end
end
