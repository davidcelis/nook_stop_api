Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  namespace :api do
    # Items and their variants
    resources :items, only: [:index, :show] do
      get :variants, on: :member
    end

    # Creatures
    resources :insects, only: [:index, :show]
    resources :fish, only: [:index, :show]
    resources :sea_creatures, only: [:index, :show]

    # DIY Crafting
    resources :recipes, only: [:index, :show] do
      get :materials, on: :member
    end

    # Villagers and their default items
    resources :villagers, only: [:index, :show] do
      get :default_furniture, on: :member
    end
  end
end
