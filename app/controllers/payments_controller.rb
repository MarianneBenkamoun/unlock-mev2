class PaymentsController < ApplicationController
  before_action :set_course

  def new
    @course =Course.find(params[:course_id])
    @course.customer_id = current_user.profile.id
    unless @course.save
      binding.pry
    end
  end

 def create


    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )
    # You should store this customer id and re-use it.

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount:       @course.price_cents,  # in cents
      description:  "Payment for course #{@course.sku} for order #{@course.id}",
      currency:     'eur',
      capture: "true"
    )



    @course.update(payment: charge.to_json, status: 'paid')
    # redirect_to waitingvalidation_courses_path(course_id:@course)




    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
  end

private

  def set_course
    # @course = Course.where(status: 'pending').find(params[:course_id])
    @course = Course.find(params[:course_id])
  end
end
