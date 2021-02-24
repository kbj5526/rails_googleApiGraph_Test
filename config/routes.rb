Rails.application.routes.draw do
  get '/accesses/index' => 'accesses#index'
  get '/accesses/:id/access' => 'accesses#access'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
