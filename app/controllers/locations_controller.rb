class LocationsController < ApplicationController
    before_action :redirect_if_not_logged_in?
def index
    @locations = Location.all
end

def show 
   
end 

def new 
    @location = Location.new
       4.times { @location.fish.build }
end 

def create 
    @location = Location.new(location_params)
    @location.fish.each do |f| 
        f.angler = current_angler
    end
    if @location.save 
        redirect_to locations_path
    else 
        render :new
    end
end

def edit
    @location = Location.find_by_id(params[:id])
end

def update
    @location = Location.find_by_id(params[:id])
    if @location.valid? 
        @location.update(location_params)
        redirect_to location_path(@location)
    else 
        render :edit
    end
end

def destroy 
    @location = Location.find_by_id(params[:id])
end 

private 

def location_params 
    params.require(:location).permit(:city, fish_attributes: [:species, :age, :color, :weight])

end

end
