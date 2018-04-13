class CoursesController < ApplicationController
skip_before_action :redirectlocksmith
require('nexmo');

def index
    if current_user.profile_type=="locksmith" #if current_user.profile_id?
      @courses = Course.where(status: 'paid', locksmith_id: nil).all.or(Course.where(status: 'attentedevis', locksmith_id: nil)).all
      @locksmith = Profile.find_by(user_id:current_user.id)

    elsif current_user.profile_type == "customer"
      redirect_to root_path
    end
  end

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
      #redirect_to "/courses/#{@course.id}/edit?service_id=#{Service.find(params[:service_id]).id}"
      redirect_to course_path(@course)

    else
      binding.pry
    end
  end

def show
  @course = Course.find(params[:id])
  if params[:locksmith]
    if @course.status == "paid"
      @course.locksmith_id = Profile.find_by(user_id:current_user.id).id
      @locksmith=Profile.find(@course.locksmith_id )
      @course.save
      @customer=Profile.find(@course.customer_id)
       client = Nexmo::Client.new(
        api_key: 'a572bb4c',
        api_secret: 'bc3c2b33e05f3d3b'
        )
         client.sms.send(
         from: 'Unlockme',
         to: @customer.phone_number.gsub(/^0/,'33').to_i,
        text: 'your order was validated ! your locksmith is'+@locksmith.name
         )
    else
      @review= Review.new
      @customer=Profile.find(@course.customer_id)
      if Review.where(course_id:@course.id).size == 1
        SetlocksmithJob.set(wait: 5.minute).perform_later(@course.id)
      end
    end
  end
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

    def destroy
  @course = Course.find(params[:id])
  @course.destroy
  redirect_to root_path
  end



private


def course_params
    params.require(:course).permit(:datetext,:hourtext,:status,:photodoor,:photoserrure, :photoserrure_cache,:photodoor_cache,sites_attributes: [ :address, :type_of ])
  end
end
