Rails.application.routes.draw do
  devise_for :users
  # ルートパスの画面をitemsコントローラーのindexビューに設定
  root to: 'items#index'
  # itemsコントローラーのアクションを定義
  resources :items
  resources :orders, only: [:index, :create]
end