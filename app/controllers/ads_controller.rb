class AdsController < ApplicationController
  before_filter :check_logged_in, :only => [:edit, :update, :destroy]
  def show
    @ad=Ad.find(params[:id])
  end
def index
  @ads = Ad.all
end
def new
@ad = Ad.new
  end
  def create
    @ad = Ad.new(ad_params)
@ad.save
redirect_to ad
  end
  def edit
    @ad=Ad.find(params[:id])
   end
   def update
    @ad = Ad.find(params[:id])

@ad.update_attributes(ad_params)
redirect_to ad_url(@ad)
   end
   def destroy
@ad = Ad.find(params[:id])
@ad.destroy
redirect_to ads_url
   end
  def ad_params
     params.require(:ad).permit(:name, :description)
   end
   private
   def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username,password|
      username == "admin" && password == "admin"
    end
end
end
