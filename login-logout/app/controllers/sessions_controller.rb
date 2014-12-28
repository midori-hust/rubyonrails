class SessionsController < ApplicationController
  
  def new
  end
 
  def create 
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
		flash[:success] = "Log in success!!!"
		log_in user
		redirect_to user  		
  	else
  		flash[:danger] = "Invalid email/ password combination"
  		render 'new'
  	end
  end
  def destroy
  	# log_out
  	session.delete(:user_id)
		@current_user = nil		
  	render "home"
  end
end
