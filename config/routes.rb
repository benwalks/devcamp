Rails.application.routes.draw do
  get 'projects', to: 'project#index'
  get 'projects/:id', to: 'project#show', as: 'project'
  post 'projects', to: 'project#create'
end
