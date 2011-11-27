class ProductsController < ApplicationController

  def index
    if params[:t]
      render :action => params[:t]
    end
  end
end
