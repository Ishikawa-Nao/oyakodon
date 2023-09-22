Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'worlds/:world_id/likes' => 'likes#create'
  get 'worlds/:world_id/likes/:id' => 'likes#destroy'
  get 'users' =>'users#index' 

  get 'worlds/top' => 'worlds#top'
  
  get 'worlds/area' => 'worlds#area'
  get 'worlds/hokkaidotohoku' => 'worlds#hokkaidotohoku'
  get 'worlds/kanto' => 'worlds#kanto'
  get 'worlds/tyubu' => 'worlds#tyubu'
  get 'worlds/kinki' => 'worlds#kinki'
  get 'worlds/tyugokushikoku' => 'worlds#tyugokushikoku'
  get 'worlds/kyusyuokinawa' => 'worlds#kyusyuokinawa'
  
  get 'worlds/genre' => 'worlds#genre'
  get 'worlds/shizen' => 'worlds#shizen'
  get 'worlds/bunka' => 'worlds#bunka'
  get 'worlds/hu' => 'worlds#hu'
  get 'worlds/kiki' => 'worlds#kiki'


  resources :worlds do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'worlds#index'

end
