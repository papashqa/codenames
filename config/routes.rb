Rails.application.routes.draw do
  get 'welcome/index'

  resources :games do
    resources :codenames
  end

  get 'games/:game_id/codenames/:n/mark', to: 'codenames#mark'

  get 'games/:id/:keyword', to: 'games#show_to_captain'
  
  root 'welcome#index'

# Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
