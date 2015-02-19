class RegistrationController < ApplicationController

	def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new entry_params
    if @cat.save
      #redirect_to action: 'index'

      #send email instantly
      #CatMailer.welcome_email(@cat).deliver

      #delay email send with gem
      CatMailer.delay(run_at: 10.minutes.from_now).welcome_email(@cat)

      #redirection to index.html
      redirect_to root_path
    else
      render :new
      # raise "Ocurrió un problema creando un gato nuevo..."
    end
  rescue ActiveRecord::RecordNotUnique
    @cat.errors.add(:email, "El email está en la base compadre")
    render :new     
  end

  private
  def entry_params
    params.require(:cat).permit(:name, :password, :password_confirmation, :birthday, :email)
  end

end