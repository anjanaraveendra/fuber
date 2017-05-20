Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :rides do
  			member do
		      put 'start'
		      put 'end'
          get 'payable_amount'
		    end
		  end
  	end
  end
end
