Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stories
  get :view_all_stories, to: 'stories#view_all_stories'
  get :my_stories, to: 'stories#my_stories'
  post :mark_as_favourite, to:'stories#mark_as_favourite'
  get :my_favourite_stories, to: 'stories#my_favourite_stories'

  root :to => "homes#index"

end
