class SetlocksmithJob < ActiveJob::Base
  queue_as :critical

  def perform(course_id)
     chosenone= Review.where(course_id:course_id).order(:price).first
     course=Course.find(course_id)
     course.locksmith=chosenone.locksmith
     course.price=chosenone.price
     course.status="devisvalide"
     course.save
  end
end

