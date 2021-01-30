Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'searches/search'

  namespace :admins do
    resources :dishes
    resources :master_menus
    resources :master_dishes do
      collection do
        get "auto_complete"
      end
    end
    resources :genres, except: [:show]
    resources :categories
    resources :menu_genres
    resources :foodstuffs
    resources :customers, only: [:index, :show, :edit, :update]
    patch '/customers/:id/hide' => 'customers#hide'
    get '/', to: 'homes#top', as: :home
  end

  resources :master_menus
  resources :master_dishes do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    collection do
        get "auto_complete"
    end
  end
  resources :customers, only: [:show, :edit, :update]
  patch '/customers/:id/hide' => 'customers#hide'
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  resources :foodstuffs, only: [:index, :show]

end