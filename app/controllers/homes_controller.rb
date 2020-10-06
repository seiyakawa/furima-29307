class HomesController < ApplicationController
  # ゲストユーザーログイン
  def new_guest
    # emailの値がすでにあれば、そのユーザーでログイン、データがなければ生成
    user = User.find_or_create_by!(email: 'aiueo@example.com') do |user|
      user.nickname = "ゲスト"
      user.password = 'abc123'
      user.password_confirmation = 'abc123'
      user.family_name_kanzi = '山田'
      user.first_name_kanzi = '太郎'
      user.family_name_kana = 'ヤマダ'
      user.first_name_kana = 'タロウ'
      user.birthday = '2000/1/1'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end