Rails.application.routes.draw do
  root to: 'main#index'
  match "/foo", to: "main#foo", via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
