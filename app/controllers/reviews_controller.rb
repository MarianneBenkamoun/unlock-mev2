class ReviewsController < ApplicationController
      skip_before_action :redirectlocksmith


    def new
    # we need @restaurant in our `simple_form_for`
    @course = Course.find(params[:course_id])
    # @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @course = Course.find(params[:course_id])
    # @user = User.find(params[:user_id])
    @review.course = @course
    @locksmith = Profile.find_by(user_id:current_user.id)
    @review.profile = @locksmith

    if @review.save
      redirect_to "/courses/#{@course.id}?locksmith=#{Profile.find_by(user_id:current_user.id).id}"
    else
      redirect_to "/courses/#{@course.id}?locksmith=#{Profile.find_by(user_id:current_user.id).id}"
    end
  end


   def destroy
    @review = Review.find(params[:id])
    @course = @review.course
    @review.destroy
    redirect_to course_path(@course)
   end

  private

  def review_params
    params.require(:review).permit(:description, :price)
  end
end
