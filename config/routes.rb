Rails.application.routes.draw do

  root 'static_pages#root'

  #get 'admin/root'

  get 'admin/info'

  get 'route/process'

  #resources :page_hierarchies

  scope :admin do
    root to: 'admin#root', as: :root_for_admin
    get 'pages/my_articles'
    get 'approve_articles', to: 'admin#approve_articles'
    get 'pages/preview/(:id)', to: 'pages#preview', as: 'page_preview'
    patch 'toggle_page_moderation_status', to: 'pages#toggle_to_be_moderated'
    #patch 'toggle_page_published/(:id)', to: 'pages#toggle_page_published', as: 'toggle_page_published'
    patch 'approve_page/(:id)', to: 'pages#approve_page', as: 'approve_page'
    resources :pages
    post 'image_uploader', to: 'image_upload#upload'
    as :user do
      get 'add_user', to: 'users/registrations#new', as: 'add_user'
      post 'register' => 'users/registrations#create', as: 'registration'
    end
    get 'users', to: 'admin#users', as: 'user_list'
  end

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get '*path' => 'route#process'

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
