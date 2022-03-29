Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'

  get 'books/index'
  get 'books/new'
  get 'books/edit'
  get 'books/show'
  
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
