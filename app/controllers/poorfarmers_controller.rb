class PoorfarmersController < ApplicationController
  def index
    # @poorfarmers = Poorfarmer.all.page(params[:page]).per(15)

    if params[:category].blank?
      @poorfarmers = Poorfarmer.all.page(params[:page]).per(8)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @poorfarmers = Poorfarmer.where(:category_id => @category_id).page(params[:page]).per(8)
    end
  end

  def show
    @poorfarmer = Poorfarmer.find(params[:id])
  end
end
