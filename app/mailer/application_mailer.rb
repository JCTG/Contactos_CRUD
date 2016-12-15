class ApplicationMailer < ActionMailer::Base
  default from: 'ruby.rails.demo@gmail.com'
  layout 'mailer'


  def bienvenido_email(user)
	  #@user = user
	  @url  = 'http://codeHero.co'
	  #mail(to: @user.email, subject: 'Aprende a programar con nuestros cursos gratis')
	  mail(to: 'ruby.rails.demo@gmail.com', subject: 'Aprende a programar con nuestros cursos gratis')
  end

end
