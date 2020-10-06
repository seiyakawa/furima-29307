Rails.application.routes.draw do
  devise_for :users
  # ルートパスの画面をitemsコントローラーのindexビューに設定
  root to: 'items#index'
  # ゲストログイン機能のパス
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  # itemsコントローラーのアクションを定義
  resources :items do
    # ある商品についての購入ネスト
    resources :orders, only: [:index, :create]
  end 
end