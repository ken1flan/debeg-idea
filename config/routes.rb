Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :ideas, only: [:show, :create] do
    resources :comments, only: :create
  end

  scope :likes do
    get 'ideas/:likable_id' => 'likes#idea'
    get 'comments/:likable_id' => 'likes#comment'
  end

  match '*path' => 'application#error404', via: :all
end
