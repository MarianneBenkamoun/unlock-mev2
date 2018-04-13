
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


  before_action :configure_sign_up_params, only: [:new,:create]
      skip_before_action :redirectlocksmith




  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
   @user=User.new(sign_up_params)
   @profile = @user.build_profile
    if params[:customer]
      @user.profile_type = "customer"
      @course=Course.find(params[:course])
    end
    super
  end

  # POST /resource
  # def create
  #   @user=User.new(sign_up_params)
  #   @user.save
  #   # @profile = @user.build_profile(params[:user][:profile])

  # super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # e

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :status,:profile,:profile_type, profile_attributes:  [ :id, :first_name, :last_name,:phone_number, maisonmere_ids: []]])
  end

  # If you have extra params to permit, append them to the sanitizer.,
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_type,:profile,profile_attributes: [ :first_name, :last_name,:phone_number,:maisonmere_ids, :status ]])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end



   def after_sign_up_path_for(resource)
    if params[:course]
     @course=Course.find(params[:course])
     new_course_payment_path(@course)
    else
      root_path
    end


    # if params[:locksmith]
    #   new_locksmith_path
    # else
    #   current_user.profile_type="customer"
    #   current_user.save
    #   if params[:pending_course_id]
    #   course_path(params[:pending_course_id])
    #   else
    #   new_customer_path
    #   end
    # end
  end


private
 # def user_params
 #    params.require(:user).permit(:status,:profile_type, :profiles, profile_attributes:  [ :id, :first_name, :last_name,:phone_number, maisonmere_ids: []])
 #  end
end
