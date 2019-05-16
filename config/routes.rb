Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'search_notebooks#index'

  get 'search_results_view', to: 'search#search_results_view', as: 'search_results_view'

  resources :search_notebooks, only: [:create, :index, :show, :destroy, :update] do 
  end
   

end
