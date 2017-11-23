Rails.application.routes.draw do
  get 'message/create'

  # Project Routes
  get 'projects', to: 'project#index'
  get 'projects/:id', to: 'project#show', as: 'project'
  get 'projects/:id/chat', to: 'project#chat', as: 'project_chat'
  post 'projects', to: 'project#create'

  # Project Messaging Routes (Chat)
  post 'messages', to: 'message#create'
end
