  require 'resque/server'
  Rails.application.routes.draw do
    mount Resque::Server, :at => "/resque"

  root    "home#index"
  get     "auth/:provider/callback",to: "sessions#create_oauth"
  get     "/users",                 to: "users#index",        as: :users
  get     "/",                      to: "users#new",          as: :signup
  post    "/users",                 to: "users#create"


  get     "/admin",                 to: "users#admin",        as: :admin
  post    "/admin",                 to: "posts#create",       as: :posts
  patch   "/admin/:id",             to: "users#make_admin",   as: :make_admin

  get     "/posts",                 to: "posts#index",        as: :all_posts
  get     "/posts/:id",             to: "posts#show",         as: :post

  get     "/signin",                to: "sessions#new",       as: :signin
  post    "/signin",                to: "sessions#create"
  get     "/my-account",            to: "sessions#show",      as: :my_account
  delete  "/signout",               to: "sessions#destroy",   as: :signout

  get     "/comments/:id",          to: "comments#new",       as: :comment_new
  post    "/comments/:id",          to: "comments#create",    as: :comment_form
  get     "/comment/:id",           to: "comments#show",      as: :comment

  get     "/categories",            to: "categories#index",   as: :categories
  get     "/categories/new",        to: "categories#new",     as: :new_category
  post    "/categories",            to: "categories#create"

  get     "/events",                to: "events#index",       as: :events
  get     "/events/new",            to: "events#new",         as: :new_event
  post    "/events",                to: "events#create"
  get     "/events/:id",            to: "events#show",        as: :event
  get     "/events/:id/edit",       to: "events#edit",        as: :edit_event
  patch   "/events/:id",            to: "events#update"

  get "/calendars",         to: "calendars#index",  as: :calendars
  get "/calendars/:id",     to: "calendars#show",   as: :calendar

  get "/tools",             to: "tools#index",      as: :tools
  post "/tools",            to: "tools#create"
  get "/tools/:id",         to: "tools#show",       as: :tool
  patch "/tools/:id",       to: "tools#update",     as: :edit_tool

  get "/about",             to: "about#index",      as: :about

  require 'resque/server'


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
