class CatsController < ApplicationController

  # this is for checking the token to external forms to be able to change the database
  # 
  skip_before_action :verify_authenticity_token

  before_action :load_cat_of_the_month, only: :index
  before_action :load_cat, except: [:index, :new]

  def index
    page  = params[:page].to_i || 1
    # page scope is provided by kamikari gem
    # https://github.com/amatsuda/kaminari/blob/master/lib/kaminari/models/active_record_model_extension.rb#L13
    @cats = Cat.visible.select(:id, :name, :birthday, :updated_at).order(:id).page(page)
  end

  def show
  end

  def edit
  end

  def update
    if @cat.update(cats_params)
      flash[:notice] = "Cat updated successfully"
      redirect_to cat_path(@cat)
    else
      flash[:error]  = "Ops! We couldn't update the cat, please review the errors"
      render :edit
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new entry_params
    if @concert.save
      redirect_to action: 'index'
    else
      #render 'error'
      raise "Cat couldn't be created..."
    end
  end

  private
  def entry_params
    params.require(:cat).permit(:name, :password, :birthday, :email)
  end
  def load_cat
    #study difference between find and where.  Find will raise an exception if the active record is not
    #found, where will return an empty array if the item is not found.
    @cat = Cat.where(id:params[:id]).visible.first
    #rescue ActiveRecord::RecordNotFound
    render text: 'Not Found', status: '404' unless @cat
  end

  def cats_params
    params.require(:cat).permit(:name, :birthday)
    #{ visible: true }.merge(params[:cat])
  end

  # Do you think this is a good place to put this logic?
  # Where would you move it?
  def load_cat_of_the_month
    @cat_of_the_month = Rails.cache.fetch("test", expires_in: Time.now.end_of_month) do
      last_month_follower_relation = FollowerRelation.where("EXTRACT(MONTH FROM created_at) = ? AND EXTRACT(YEAR FROM created_at) = ?", 1.month.ago.month, 1.month.ago.year)
      # First alternative
      # Retrieve results from database without order and use ruby function to order hash
      count_of_followers = last_month_follower_relation.group(:followed_cat_id).count
      # http://www.rubyinside.com/how-to/ruby-sort-hash
      cat_of_the_month_data = count_of_followers.sort_by { |k, v| -v }.first
      Cat.find(cat_of_the_month_data.first) if cat_of_the_month_data  
    end

    # # Second alternative
    # # Order the results with SQL query an retrieve one result
    # # I just googled "Order by group by count" to find this solution
    # cat_of_month_id = last_month_follower_relation.
    #   group(:followed_cat_id).
    #   select("followed_cat_id, COUNT(*) as followers_count").
    #   order("followers_count DESC").
    #   limit(1).first.try(:followed_cat_id)
    #
    # # http://apidock.com/rails/Object/try
    #
    # @cat_of_the_month = Cat.find(cat_of_month_id) if cat_of_month_id

  end
end
