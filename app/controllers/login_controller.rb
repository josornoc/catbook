class LoginController < ApplicationController

	def create
		cat = Cat.where(email:params[:email]).first		
		if cat && cat.authenticate(params[:password])
			flash[:success] = "The cat is under the table"
			flash[:jijuemadre] = cat.name + " se ha logueado. Tenaz."
			session[:logged_in_cat] = cat.id
			redirect_to cat_path(cat)
		else
			flash[:error_logging_in] = "The cat couldn't be logged in..."
		end
	end

	def destroy
		session[:logged_in_cat] = nil
		redirect_to root_path
	end
	
end
