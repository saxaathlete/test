class ActivationsController < ApplicationController
 
  def new
    @user = User.find_using_perishable_token(params[:activation_code]) 
    unless @user.blank?
      if @user.active?
        flash[:error] = "You are alredy activated"
        redirect_to root_path
      end
    else
      flash[:error] = "User with this activation code not found"
      redirect_to root_path
    end
  end

  def create
    @user = User.find(params[:id])
    
    if @user.active?
      flash[:error] = "You are alredy activated"
      redirect_to root_path
    end

    if @user.activate!(params)
      @user.deliver_activation_confirmation!
      flash[:notice] = "Your account has been activated."
      redirect_to root_url
    else
      render :action => :new
    end
  end


end
