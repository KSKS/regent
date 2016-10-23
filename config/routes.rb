Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get 'capitol_hill' => 'pages#capitol_hill', as: :caphill
  get 'redmond' => 'pages#redmond', as: :redmond
  get 'bakery' => 'pages#bakery', as: :bakery
  get 'redmond_menu' => 'pages#redmond_menu', as: :redmond_menu
  get 'cap_menu' => 'pages#cap_menu', as: :cap_menu
  get 'redmond_food' => 'pages#redmond_food', as: :redmond_food
  get 'cap_food' => 'pages#cap_food', as: :cap_food
  get 'drinks' => 'pages#drinks', as: :drinks
  # get 'mooncakes' => 'pages#mooncakes', as: :mooncakes
  root 'pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
