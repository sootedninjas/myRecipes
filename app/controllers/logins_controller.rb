class LoginsController < ApplicationController
  def new
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "Login Successful"
      redirect_to chef_path(chef)
    else
      flash.now[:danger] = "eMail and/or password Not Authenticated"
      render 'new'
    end
  end
  
  def destroy
    if session[:chef_id] == nil
      redirect_to root_path
    else
      session[:chef_id] = nil
      flash[:success] = "Logout Successful"
      redirect_to root_path
    end

  end
end
