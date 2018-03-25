class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id:current_user.id)
  end

  def new
        @profile = Profile.create(email: current_user.email, user_id:current_user.id, first_name:current_user.first_name, last_name:current_user.last_name, phone_number:current_user.phone_number.gsub(/^0/,'33'))

  end

  def create

  end

  def edit
    @profile = Profile.find(params[:format])
  end

  def update
    @profile = Profile.find(params[:format])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

   def waitingvalidation2
      @course = Course.find(params[:course_id])
    end


  def confirmation

  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :status,:photo, :photo_cache)
  end

end
