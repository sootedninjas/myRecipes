Rails.application.routes.draw do
  root 'pages#home'
 get '/home', to: 'pages#home'
 
 # get '/recipes', to: 'recipes#index'
 # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
 # post '/recipes', to: 'recipes#create', as: 'create_recipe'
 # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
 # patch '/recipes/:id', to: 'recipes#update', as: 'update_recipe'
 # get '/recipes/:id', to: 'recipes#show', as: 'show_recipe'
 # delete '/recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'
 
 resources :recipes
 resources :chefs
end
 