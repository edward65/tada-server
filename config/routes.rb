Rails.application.routes.draw do
  resources :users

  root to: redirect('/orders')
  resources :orders


  MISSING_JSON_PATH = "general#append_json"



  def api_get(params)
    uri, path = params.first
    get "#{uri}.json" => path, :format => "json"
    get uri => MISSING_JSON_PATH
  end

  def api_post(params)
    uri, path = params.first
    post "#{uri}.json" => path, :format => "json"
    post uri => MISSING_JSON_PATH
  end

  def api_delete(params)
    uri, path = params.first
    delete "#{uri}.json" => path, :format => "json"
    delete uri => MISSING_JSON_PATH
  end

  def api_put(params)
    uri, path = params.first
    put "#{uri}.json" => path, :format => "json"
    put uri => MISSING_JSON_PATH
  end


  #訂單
  api_post "api/v1/add_order" => "api/v1/api_orders#create_order"

  api_get "api/v1/getorder" => "api/v1/api_orders#index_ok"
  api_put "api/v1/putorder" => "api/v1/api_orders#update_ok"

  #user
  api_post "api/v1/user_register" => "api/v1/api_users#create_user"
  api_post "api/v1/verify_code" => "api/v1/api_users#verify_code"

  api_get "api/v1/test_api" => "api/v1/api_users#test_api"





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
