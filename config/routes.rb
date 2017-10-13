Rails.application.routes.draw do
  devise_for :users
  get :workspace, to: 'workspace#index'
  root 'welcome#index'
end
