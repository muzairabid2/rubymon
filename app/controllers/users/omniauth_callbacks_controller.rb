class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  #Facebook login call back function

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in(@user)
      redirect_to "/dashboard"
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      sign_in(@user)
      redirect_to after_sign_in_path_for(current_user)
    end
  end

end