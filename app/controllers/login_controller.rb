class LoginController < ApplicationController
	def create

		cat = Cat.where(email:params[:email]).first
		
		if cat && cat.authenticate(params[:password])
			flash[:success]
			session[:logged_in_cat] = cat.id
		end
	end

	def destroy
		session[:logged_in_cat] = nil
	end
end
