class FishController < ApplicationController

def index 
    @all_fish = Fish.all
end

def show 
    @fish = Fish.find_by_id(params[:id])
end

def heaviest_fish 

end

end
