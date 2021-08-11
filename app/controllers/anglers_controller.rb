class AnglersController < ApplicationController
    def new 
        @angler = Angler.new
    end

    def show
        @angler = Angler.find_by_id(params[:id])
    end
    
    def create 
        @angler = Angler.new(angler_params)
        if @angler.save 
            session[:angler_id] = @angler.id
            redirect_to angler_path(@angler)
        else 
            render :new
        end
    end

private 
def angler_params 
    params.require(:angler).permit(:username, :email, :password)
end
end
