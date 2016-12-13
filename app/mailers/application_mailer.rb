class ApplicationMailer < ActionMailer::Base
  default from: 'juan_carlos_tovar_garnica@hotmail.com'
  layout 'mailer'
  
  def bienvenido_email(user)
  	puts 'entro al metodo >>>>>>>>> bienvenido_email'
	  #@user = user
	  #@url  = 'http://codeHero.co'
	  #mail(to: @user.email, subject: 'Aprende a programar con nuestros cursos gratis')
	  #mail(to: 'juan_carlos_tovar_garnica@hotmail.com', subject: 'Aprende a programar con nuestros cursos gratis')
  end

end

