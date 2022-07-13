Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/retailstores/new', to: 'retailstores#new'
  get '/retailstores', to: 'retailstores#index'
  delete '/retailstores', to: 'retailstores#delete'
  get '/retailstores/:id', to: 'retailstores#show'
  get '/retailstores/:id/edit', to: 'retailstores#edit'
  post '/retailstores', to: 'retailstores#create'
  patch '/retailstores/:id', to: 'retailstores#update'
  delete '/retailstores/:id', to: 'retailstores#delete'

  get '/retailstores/:retailstore_id/items?number=:number', to: 'retailstore_items#index'
  get '/retailstores/:retailstore_id/items?sort=activated', to: 'retailstore_items#index'
  get '/retailstores/:retailstore_id/items', to: 'retailstore_items#index'
  get '/retailstores/:retailstore_id/items/new', to: 'retailstore_items#new'
  post '/retailstores/:retailstore_id/items', to: 'retailstore_items#create'

  get "/items/:id/edit", to: 'items#edit'
  get '/items', to: 'items#index'
  patch '/items/:id', to: 'items#update'
  get '/items/:id', to: 'items#show'
  delete '/items/:id', to: 'items#delete'

end
