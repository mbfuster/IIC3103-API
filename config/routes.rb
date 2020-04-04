Rails.application.routes.draw do
  get 'search/show'
  get 'place/show'
  get 'character/show'
  get 'chapter/show'
  root 'greetings#get_chapter'
  get '/search', to: 'search#searches'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chapter
  resources :character
  resources :place
end
