desc 'send email'
task send_email: :environment do
	#UserMailer.mailer(User.last).deliver!
	UserMailer.mailer('juan_carlos_tovar_garnica@hotmail.com').deliver!
end