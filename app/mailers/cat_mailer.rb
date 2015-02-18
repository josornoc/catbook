class CatMailer < ActionMailer::Base

  default from: "catbook@esdeluxe.com"

  def welcome_email(cat)
    @cat = cat
    @url  = 'localhost:3000/'
    mail(to: @cat.email, subject: 'Welcome to Cat Universe')
  end

end
