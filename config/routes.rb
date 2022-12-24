Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'top' => 'homes#top'
  get 'books/new'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'users/show'
  get 'users/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end