Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/about' => 'homes#about'

  namespace :admins do
    resources :post_menus, only: [:index, :show, :destroy]
    resources :post_dishes, only: [:index, :show, :destroy]
    resources :dishes
    resources :master_menus
    resources :master_dishes
    resources :genres
    resources :categories
    resources :menucategories
    resources :foodstuffs
    resources :customers, only: [:index, :show, :edit, :update]
    patch '/customers/:id/hide' => 'customers#hide'
    get '/', to: 'homes#top', as: :home
  end
  
  resources :post_menus
  resources :post_dishes
  resources :master_menus, only: [:index, :show]
  resources :master_dishes, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  patch '/customers/:id/hide' => 'customers#hide'
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  resources :foodstuffs, only: [:index, :show]
  
end