# /cats -> HTTP HEADER ACCEPT HTML
# /cats -> HTTP HEADER ACCEPT JSON
# /api/v1/cats?filter.name=Name&limit=1
# /api/v1/cats?filter.name=Name&limit=1


class ApiController < ApplicationController

	def cats

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
	end
end

# module API
# 	module V1
# 		class ApiController < ApplicationController

# 			def index

# 				cats = Cat.all

# 				cats_collection = cats.map do |cat|
# 					{
# 						name: cat.name,
# 						birthday: cat.birthday,
# 						links: {
# 							public: cat_path(cat)
# 						}
# 					}
# 				end

# 				render json: cats_collection

# 				# respond_to do |format|
# 				# 	format.html { render :index }
# 				# 	format.json { render :index }
# 				# end

# 				# render text:
# 				# render xml:
# 				# render js:
# 				# render json:

# 			end
# 		end
# 	end
# end