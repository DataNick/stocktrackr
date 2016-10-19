Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  resources :portfolios do
    resources :positions do
      resources :movements do
        collection do
          post 'sell'
        end
      end
    end
  end


  get "*path" => redirect("/")

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
