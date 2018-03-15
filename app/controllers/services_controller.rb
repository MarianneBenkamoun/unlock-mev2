class ServicesController < ApplicationController
    # skip_before_action :authenticate_user!, only: :index
    # skip_before_action :authenticate_user!, only: :show
  def index
    @services = Service.all
    # if params[:search]
    #   if params[:search] == ""
    #     @recipes = Recipe.all
    #     respond_to do |format|
    #       format.html { redirect_to recipes_path}
    #       format.js
    #     end
    #   else
    #     @ingredient = params[:search]
    #     @recipes = params[:search]
    #     respond_to do |format|
    #     format.html { redirect_to recipes_path }
    #     format.js
    #     end
    #   end
    # else
    #   @recipes = Recipe.all
    # end
  end

  def show #exactement le meme code que dans pages#home
    @service = Service.find(params[:id])

    # @course = Course.new

    # @course.sites.build
    # if current_user && current_user.provider == "facebook"
    #   redirect_to new_course_path
    # elsif current_user && current_user.profile_type == "Locksmith"
    #   current_locksmith = Locksmith.find(current_user.profile_id)
    #   if current_locksmith.status == true
    #     redirect_to courses_path
    #   else
    #     redirect_to confirmation_locksmiths_path
    #   end
    # end
  end
end
