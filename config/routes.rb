Aww::Application.routes.draw do
  get "image/index"
  root :to => 'image#index'
end
