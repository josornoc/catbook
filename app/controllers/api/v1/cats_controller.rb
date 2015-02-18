module Api
	module V1
		class CatsController < ApplicationController

			def index

				cats = Cat.all

				cats_collection = cats.map do |cat|
					{
						name: cat.name,
						birthday: cat.birthday,
						links: {
							public: cat_path(cat)
						}
					}
				end

				render json: cats_collection

				# respond_to do |format|
				# 	format.html { render :index }
				# 	format.json { render :index }
				# end

				# render text:
				# render xml:
				# render js:
				# render json:

			end
		end
	end
end