class RegulationController < ApplicationController

  def index
  end
  
  def show
	render :action => 'show', :layout => false
	end
end
