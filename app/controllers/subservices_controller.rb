class SubservicesController < ApplicationController
  def show
    @subservice = Subservice.find(params[:id])
    @subservices = Subservice.all
    # end
  end
end
