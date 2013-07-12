RunAllTest::Application.routes.draw do
  resources :identifications
  root :to => 'identifications#new'
  match '/home', to: 'identifications#new'
  match '/select', to:'identifications#select'
  
end
