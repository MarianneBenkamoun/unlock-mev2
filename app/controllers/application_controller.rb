class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :redirectlocksmith





  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:phone_number])
#     # For additional in app/views/devise/registrations/edit.html.erb
#     devise_parameter_sanitizer.permit(:account_update, keys: [:username])

  end



 def profile_controller?
    params[:controller] == "profiles"
    end
 def course_controller?
    params[:controller] == "courses"
    end


def redirectlocksmith
  if current_user && current_user.profile_type == "locksmith" && current_user.status == true
      current_locksmith = Profile.find_by(user_id:current_user.id)
        redirect_to courses_path

    elsif current_user && current_user.profile_type == "locksmith" && current_user.status == false
        redirect_to confirmation_profile_path

    end
end

end
