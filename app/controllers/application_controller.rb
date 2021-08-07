class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  #新規登録時のストロングパラメータに「nicknameカラム」の追加
  def configure_permitted_parameters
    #新規登録時のストロングパラメータに「nicknameカラムとageカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :tag_ids => []])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :email, :tag_ids => []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :icon, :tag_ids => []])
  end
end 
