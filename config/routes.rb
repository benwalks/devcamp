Rails.application.routes.draw do
  get 'projects', to: 'project#index'
  post 'projects', to: 'project#create'
end
