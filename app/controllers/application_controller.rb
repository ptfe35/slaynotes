class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後に遷移する画面を設定
  def after_sign_up_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when EndUser
      end_user_path(current_end_user)
    end
  end

  # ログイン後に遷移する画面を設定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when EndUser
      end_user_path(current_end_user)
    end
  end

  # ログアウト後に遷移する画面を設定
  def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin_admin
        new_admin_admin_session_path
      else
        new_end_user_session_path
      end
  end

  protected

  # 新規会員登録の入力項目にnameを追加
  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
