Rails.application.routes.draw do
  root "welcome#index"

  resources :posts do
    resources :comments
  end
  
  get 'welcome/resume'
end
