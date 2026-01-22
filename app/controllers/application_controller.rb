class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def configure_permitted_parameters
    # Sign up လုပ်တဲ့အခါ name, profile, occupation, position တို့ကိုပါ လက်ခံဖို့ ခွင့်ပြုလိုက်တာ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end
