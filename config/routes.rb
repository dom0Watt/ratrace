RunAllTest::Application.routes.draw do
  resources :identifications
  root :to => 'identifications#new'
  match '/home', to: 'identifications#new'
  
end
