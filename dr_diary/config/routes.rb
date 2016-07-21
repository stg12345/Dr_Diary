Rails.application.routes.draw do
  
  

  get 'posts/new'
  post 'posts/new' => 'posts#create'
  get 'posts/edit'
  post 'posts/edit' => 'posts#update'
  get 'posts/show'
  get 'posts/delete'
  post 'posts/delete' => 'posts#destroy'
  get 'posts/index'

  get 'diaries/new'

  get 'diaries/delete'
  post 'diaries/delete' => 'diaries#destroy'
  post 'diaries/new' => 'diaries#create'
  get 'diaries/edit'
  post 'diaries/edit' => 'diaries#update'
  get 'diaries/show_mine'

  root 'access#index'
  get 'access/index' => 'access#index'
  post 'access/login' => 'access#attempt_login'
  get 'access/login' => 'access#login'
  get 'access/logout'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  get 'users/list'
  get 'users/edit' => 'users#edit'
  post 'users/edit' => 'users#update'

  get 'followers/view_users_to_follow'
  get 'followers/show_followers'
  get 'followers/show_following'
  post 'followers/view_users_to_follow' => 'followers#check_follow_user'
  
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
