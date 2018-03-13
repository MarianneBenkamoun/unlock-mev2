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
end
