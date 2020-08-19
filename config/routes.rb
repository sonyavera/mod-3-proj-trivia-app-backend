Rails.application.routes.draw do
  get 'quizzes/new', to: 'quizzes#new', as: 'new_quiz'
  post 'quizresults/update', to: "quiz_results#update"
  post 'quizzes/find', to: 'quizzes#find'
  post 'users/create', to: 'users#create'
  get '/signup' => 'users#signup', as: 'signup'
  post '/login' => 'sessions#login', as: 'login'

  resources :quiz_results
  resources :quizzes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
