Rails.application.routes.draw do
  get 'quizzes/new', to: 'quizzes#new', as: 'new_quiz'
  post 'quizzes/find', to: 'quizzes#find'
  post 'users/create', to: 'users#create'

  resources :quiz_results
  resources :quizzes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
