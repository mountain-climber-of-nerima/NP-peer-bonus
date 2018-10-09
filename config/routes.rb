Rails.application.routes.draw do
  post 'likes/create' => "likes#create"
  post "likes/destroy" => "likes#destroy"

  get 'reply_messages/new' => "reply_messages#new"
  post "reply_messages/update" => "reply_messages#update"

  get 'messages/new' => "messages#new"
  post "messages/create" => "messages#create"
  get "messages/sample/show" => "messages#sample_show"
  get "messages/complete" => "messages#complete"
  get "messages/:id/inbox_index" => "messages#inbox_index"
  get "messages/:id/sent_index" => "messages#sent_index"
  get "messages/:id/inbox_show/1" => "messages#inbox_show_1"
  get "messages/:id/inbox_show/2" => "messages#inbox_show_2"
  get "messages/:id/inbox_show/3" => "messages#inbox_show_3"
  get "messages/:id/sent_show/1" => "messages#sent_show_1"
  get "messages/:id/sent_show/2" => "messages#sent_show_2"
  get "messages/:id/sent_show/3" => "messages#sent_show_3"
  post "messages/destroy" => "messages#destroy"
  get "messages/edit" => "messages#edit"
  post "messages/update" => "messages#update"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/edit" => "users#edit"
  post "users/update" => "users#update"

  get "/" => "home#top"
  get "about" => "home#about"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
