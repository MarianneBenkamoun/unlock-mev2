class CoursesController < ApplicationController
  def new
    @course = Course.new
    @course.sites.build

    @service=Service.find(params[:service_id])

  end

  def create
    @course = Course.new(course_params)

    # @course.sku = "course_" + @course.id.to_s
    @service=Service.find(params[:service_id])
    @course.service=@service
    @course.price=@service.price
    # @course.compute_infos
    # Set kms / time / price using Google API

    if @course.save
      # redirect_to "/courses/#{@course.id}?service=#{Service.find(params[:service_id]).id}"
      redirect_to "/courses/#{@course.id}/edit?service_id=#{Service.find(params[:service_id]).id}"

    else
      render 'new'
    end
  end

  def show
      @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
    @service=Service.find(params[:service_id])
  end

  def update
    @course=Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end



private


def course_params
    params.require(:course).permit(:datetext,:hourtext,:status,:photodoor,:photoserrure,sites_attributes: [ :address, :type_of ])
  end
end
