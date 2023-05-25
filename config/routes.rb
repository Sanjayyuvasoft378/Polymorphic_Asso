Rails.application.routes.draw do
  
  # root "articles#index"
  root "employees#index"
  resources :employees
  resources :products
  resources :pictures
  
end
