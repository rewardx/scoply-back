Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'

  get '/', as: :root, controller: :root, action: :index

  scope 'api/v1', module: 'api_v1', defaults: { format: 'json' } do
    resources :companies
    resources :users
    resources :repositories
  end

end
