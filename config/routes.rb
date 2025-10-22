Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about"

  devise_for :users

  resources :articles do
    collection do
      get :lessons
      get :catalog
    end
  end

  resources :dictionary_terms, only: [:index, :show]

  resources :quizzes
  resources :quiz_questions
  resources :quiz_choices
  resources :quiz_attempts
  resources :quiz_answers

  resources :community_posts do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
    collection do
      get :gallery     # фильтр post_type=gallery
      get :questions   # фильтр post_type=question
    end
  end

  resources :meetups, only: [:index, :show]

  resources :portfolio_items
end