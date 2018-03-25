class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id:current_user.id)
  end

  def new
        @profile = Profile.create(email: current_user.email, user_id:current_user.id, first_name:current_user.first_name, last_name:current_user.last_name, phone_number:current_user.phone_number.gsub(/^0/,'33'))

  end

  def create
    @locksmith = Locksmith.new(email: current_user.email, user_id:current_user.id, first_name:current_user.first_name, last_name:current_user.last_name, phone_number:current_user.phone_number.gsub(/^0/,'33'))

    @locksmith.status = false


    @locksmith.user_id = current_user.id
    if @locksmith.save
      redirect_to confirmation_locksmiths_path
    else
      render :new
    end
  end

  def edit
    @locksmith = Locksmith.find(params[:id])
  end

  def update
    @locksmith = Locksmith.find(params[:id])
    if @locksmith.update(locksmith_params)
      redirect_to locksmith_path(@locksmith)
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

  def locksmith_params
    params.require(:locksmith).permit(:first_name, :last_name, :phone_number, :mail, :status, :entreprise,:photo, :photo_cache,:licensephoto,:licensephoto_cache, maison_mere:[])
    # params.require(:locksmith).permit(:first_name, :last_name, :phone_number, :mail,
    #   :picture, :status )
  end

end
