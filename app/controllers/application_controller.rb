class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #新規登録時のストロングパラメータに「nicknameカラム」の追加
  def configure_permitted_parameters
    #新規登録時のストロングパラメータに「nicknameカラムとageカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :tag_ids => []])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :tag_ids => []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :icon, :tag_ids => []])
  end

end 
