class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # 从请求中获取用户认证信息
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # 登录并重定向
      sign_in_and_redirect @user, event: :authentication
      # 显示成功消息
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      # 保存数据以便在注册页面使用
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      # 重定向到注册页面并显示错误信息
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path
  end
end
