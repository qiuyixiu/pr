class PoorfarmersController < ApplicationController
  def index
    @poorfarmers = Poorfarmer.all.page(params[:page]).per(15)
    # if params[:category].present?
    #    @category = params[:category]
    #    if @category == '所有贫困户'
    #      @poorfarmers = Poorfarmer.paginate(:page => params[:page].per(1))
    #    else
    #      @poorfarmers = Poorfarmer.where(:category => @category).paginate(:page => params[:page].per(1))
    #    end
    #  end
  end

  def show
    @poorfarmer = Poorfarmer.find(params[:id])
  end
end
