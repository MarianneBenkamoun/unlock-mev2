class SetlocksmithJob < ActiveJob::Base
  queue_as :critical
require('nexmo');


  def perform(course_id)
     chosenone= Review.where(course_id:course_id).order(:price).first
     course=Course.find(course_id)
     course.locksmith_id = chosenone.profile.id
     course.price=chosenone.price
     course.status="devisvalide"
     course.save
     @customer=Profile.find(course.customer_id)


        client = Nexmo::Client.new(
        key: 'a572bb4c',
        secret: 'bc3c2b33e05f3d3b'
        )
         client.sms.send(
         from: 'Unlockme',
         to: @customer.phone_number.gsub(/^0/,'33').to_i,
        text: 'your order was validated ! click on http://www.unlockme.io/courses/#{course_id}//payments/new, to complete your order, thanks'
         )
  end
end

