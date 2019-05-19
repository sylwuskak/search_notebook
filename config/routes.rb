Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'search_notebooks#index'

  get 'search_results_view', to: 'search#search_results_view', as: 'search_results_view'
  get 'statistics', to: 'statistics#get_statistics', as: "get_statistics"
  get 'tests', to: 'tests#tests', as: "tests"
  post 'check_data', to: 'tests#check_data', as: "check_data"

  resources :search_notebooks, only: [:create, :index, :show, :destroy, :update] do 
  end
   
  resources :search_results, only: [:create, :show, :destroy] do 
  end

end
