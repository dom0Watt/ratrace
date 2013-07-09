RunAllTest::Application.routes.draw do
  resources :identifications
  root :to => 'identifications#new'

  
end
