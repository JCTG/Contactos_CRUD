class ApplicationMailer < ActionMailer::Base
  default from: 'juan.tovar@vun.mx'
  layout 'mailer'


  def bienvenido_email(user)
	  #@user = user
	  @url  = 'http://codeHero.co'
	  #mail(to: @user.email, subject: 'Aprende a programar con nuestros cursos gratis')
	  mail(to: 'juan_carlos_tovar_garnica@hotmail.com', subject: 'Aprende a programar con nuestros cursos gratis')
  end

end
