Rails.application.routes.draw do
  get 'chapter/show'
  root 'greetings#get_chapter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chapter
end
