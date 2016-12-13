Rails.application.routes.draw do
  resources :libreta do
  	
		member do
			get 'mail', to: 'libreta#enviar_correo'
		end
  		#get '/libreta/:id/mail', to: 'libreta#enviar_correo'
	end

end
