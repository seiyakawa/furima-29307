class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
# ログインしていない場合は、ログイン画面に遷移
  before_action :configure_permitted_parameters, if: :devise_controller?
# すべてのアクションの前に実行
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == "furima" && password == "1111"
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end   
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  # ストロングパラメーター [nickname]キーの内容の保存をpermitメソッドで許可
end
