class FishController < ApplicationController

def index 
    @all_fish = Fish.all
end

def show 
    @fish = Fish.find_by_id(params[:id])
end

def new 
end

def create
    @fish = Fish.new(fish_params)
        if params[:location_id]
            @location = Location.find_by_id(params[:location_id])
        end
        if @fish.save
            redirect_to fish_index_path
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
        params.require(:fish).permit(:species, :color, :weight, :age, :location_id, location_attributes: [:city, :state])
    end
    
    def find_fish
        @fish = Fish.find_by_id(params[:id])
    end
end
