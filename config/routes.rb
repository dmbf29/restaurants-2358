Rails.application.routes.draw do
  # CRUD routes

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end

# link_to restaurant_review_path(restaurant, review)
# link_to review_path(review)

# only for non-crud routes
# get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
  # get '/restaurants/:id/navigate', to: 'restaurants#top', as: :top_restaurants
# collection do
#       get 'top'
#     end
#     member do
#       get 'navigate'
#     end
# collection -> its about all the restaurants (no id)
# member ->    its about one specific restaurant (aka need id)

# root to: "restaurants#index"
# We use the prefix when we build links and forms
# link_to "All", restaurants_path # GET
# form restaurants_path # POST
# link_to "Sukiya", restaurant_path(restaurant) # GET
# form restaurant_path(restaurant) # PATCH


 # http_verb '/path', to: 'controller_name#action', as: :prefix (aka nickname of the path)
  # PREFIX -> only refers to the path, not the http verb
  # Read all -> index
  # get "/restaurants", to: "restaurants#index", as: :restaurants
  # # Create a restaurant
  # # we need a page for the form
  # get "/restaurants/new", to: "restaurants#new", as: :new_restaurant
  # # we need a place to send the form data
  # post "/restaurants", to: "restaurants#create" # already has a prefix

  # # See details about one restaurant -> show
  # get "/restaurants/:id", to: "restaurants#show", as: :restaurant

  # # Update a restaurant
  # # we need a page for the form
  # get "/restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  # # we need a place to send the form data
  # patch "/restaurants/:id", to: "restaurants#update"

  # # Destroy a restaurant
  # delete "restaurants/:id", to: "restaurants#destroy"
