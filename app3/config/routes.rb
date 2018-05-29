Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'report1', to: 'report#report1'
  get 'report2', to: 'report#report2'
end
