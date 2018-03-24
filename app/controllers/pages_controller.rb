class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, :home, :landing_page

  def home
    if params[:service_id]
      @service = Service.find(params[:service_id])
    end

    @course = Course.new
    @course.sites.build


    if current_user && current_user.provider == "facebook"
      redirect_to new_course_path
    elsif current_user && current_user.profile_type == "locksmith"
      current_locksmith = Locksmith.find_by(user_id:current_user.id)
      if current_locksmith.status == true
        redirect_to courses_path
      else
        redirect_to confirmation_locksmiths_path
      end
    end
  end

  def showsubservices
    @service = Service.find(params[:idservice])
    subservices = Subservice.all
  end

  def landing_page
  end

  private

  def course_params
    params.require(:course).permit(:locksmith_rating)
  end

end
