Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]do # new နဲ့ create အတွက် လမ်းကြောင်းဖွင့်ပေးတာပါ
# prototypes ရဲ့ ID ပါ ပါလာအောင် Nested လုပ်ပြီး create ကို သတ်မှတ်ခြင်း
  resources :comments, only: :create
  end
  resources :users, only: :show
end
