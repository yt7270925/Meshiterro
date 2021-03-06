class ApplicationController < ActionController::Base
  # ログインしていないとトップページ以外にアクセスできない権限制限
  before_action :authenticate_user!, except: [:top]

  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッドです。
  def after_sign_in_path_for(resource)
    post_images_path #indexへのリダイレクト
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
