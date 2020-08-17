Rails.application.routes.draw do
  get 'quizzes/new', to: 'quizzes#new'

  resources :quiz_results
  resources :quizzes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
