class FishController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_fish, only: [:show, :update, :edit, :destroy]
layout "fish"


def index 
    if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
        @fish = Fish.order_by_weight
    end
    @fish = Fish.color_selector(params[:fish][:color]) if params[:fish] && !params[:fish][:color].blank?
end

def show 
    @fish = Fish.find_by_id(params[:id])
end

def new 
    if params[:location_id] && @location = Location.find_by_id(params[:location_id])
        @fish = @location.fish.build 
    else 
        @fish = Fish.new
        # @fish.build_location
    end
end

def create
    @fish = Fish.new(fish_params)
        if params[:location_id]
            @location = Location.find_by_id(params[:location_id])
        end
        if @fish.save
            redirect_to location_fish_index_path
        else
            render :new
        end
end


def update 
end


    def destroy 
        @fish = Fish.find_by_id(params:[:id])
        if @fish.present?
        @fish.destroy 
        end
        redirect_to fish_index_path
    end

    private 

    def fish_params 
        params.require(:fish).permit(:species, :age, :color, :weight, :angler_id, :location_id, location_attributes: [:city])
    end
    
    def find_fish
        @fish = Fish.find_by_id(params[:id])
    end
end
