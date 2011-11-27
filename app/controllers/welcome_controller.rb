class WelcomeController < ApplicationController

  def index
	  render :layout => false 
  end
  
  def show
      @userspro = User.find(:all, :conditions => ["category = ? and status = ?", "pro", 1], :order => "note DESC", :limit => 3)
     @userspar = User.find(:all, :conditions => ["category = ? and status = ?", "par", 1], :order => "note DESC", :limit => 3)
 end
 
 def classement
    @userspro = User.find(:all, :conditions => ["category = ? and status = ?", "pro", 1], :order => "note DESC")
    @userspar = User.find(:all, :conditions => ["category = ? and status = ?", "par", 1], :order => "note DESC")
 end

 def howtoplay
 end
end
