Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  #_____/users
  resources :users

  #_____/products
  resources :products do
    get :who_bought, on: :member
  end


  #non-administrative functions are nested under :locale so that there are 'en' and 'es' versions of each of those pages
  #we would outsource the translation of the 'es' (spanish) pages
  #administrative functions (users, products) are not nested under locale b/c it's not our intention to translate those
  #:locale is in parens which is a way to say that it is optional, it will default to location....everything here will be xxx/en
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    #root = http://localhost:3000
    root 'store#index', as: 'store_index', via: :all
  end

end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
