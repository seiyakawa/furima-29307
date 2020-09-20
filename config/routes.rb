Rails.application.routes.draw do
  devise_for :users
  # ルートパスの画面をitemsコントローラーのindexビューに設定
  root to: 'items#index'
  # itemsコントローラーのアクションを定義
  resources :items do
    # ある商品についての購入ネスト
    resources :orders
  end 
end