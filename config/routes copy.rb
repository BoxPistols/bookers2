Rails.application.routes.draw do
  devise_for :users
  # users routing
  resources :users, only: [:index, :show, :edit, :update]

  root 'homes#top'

  get 'home/about' => 'homes#about', as: "about"

  # get 'books/index'
  get 'books' => 'books#index', as: "books"

  # POST
  # get 'books/new' => 'books#new', as: "new_book"
  post 'books' => 'books#create'

  # show 詳細画面
  # get 'books/:id' => 'books#show'
  get 'books/:id' => 'books#show', as: "book"

  # edit 編集画面
  get 'books/:id/edit' => 'books#edit', as: "edit_book"
  patch 'books/:id' => 'books#update', as: 'update_book'

  # destroy 削除
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
