Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'how' => 'pages#how'
  get 'garanty' => 'pages#garanty'

  get 'changeorder' => 'products#changeorder'

  devise_scope :user do
  get 'admin', to: 'devise/sessions#new'
end

  resources :products do
  	collection do
  		patch :sort
  	end
  	member do
		delete :delete_image_attachment
	end
  end
end
