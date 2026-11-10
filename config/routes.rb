Rails.application.routes.draw do
  # http_verb '/path', to: 'controller_name#action', as: :prefix (aka nickname of the path)
  # PREFIX -> only refers to the path, not the http verb
  # Read all -> index
  get "/restaurants", to: "restaurants#index", as: :restaurants
  # Create a restaurant
  # we need a page for the form
  get "/restaurants/new", to: "restaurants#new", as: :new_restaurant
  # we need a place to send the form data
  post "/restaurants", to: "restaurants#create" # already has a prefix

  # See details about one restaurant -> show
  get "/restaurants/:id", to: "restaurants#show", as: :restaurant

  # Update a restaurant
  # we need a page for the form
  get "/restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  # we need a place to send the form data
  patch "/restaurants/:id", to: "restaurants#update"

  # Destroy a restaurant
end

# We use the prefix when we build links and forms
# link_to "All", restaurants_path # GET
# form restaurants_path # POST
# link_to "Sukiya", restaurant_path(restaurant) # GET
# form restaurant_path(restaurant) # PATCH
