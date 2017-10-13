Rails.application.routes.draw do
  devise_for :users
  get :workspace, to: 'workspace#index'
  namespace :users do
    resource :profiles, only: [:edit, :update] do
      get '/', to: 'profiles#index'
    end
  end
  root 'welcome#index'
end
