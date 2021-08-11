class SessionsController < ApplicationController
    def welcome 
        render layout: 'welcome'
    end
    
    def new 
    end

    def create 
        angler = Angler.find_by_email(params[:angler][:email])
        if angler.try(:authenticate, params[:angler][:password])
            session[:angler_id] = angler.id
            redirect_to fish_index_path
        else
            flash[:message] = "Invalid credentials. Please try again. "
            redirect_to login_path
        end
       
    end

    def omniauth
        angler = Angler.from_omniauth(auth)
        if angler.valid? 
            session[:angler_id] = angler.id
            flash[:message] = "Successful Login!!"
            redirect_to fish_index_path
        else
        end
    end

    def destroy 
        session.delete(:angler_id)
        redirect_to fish_index_path
    end

    private 
        def auth 
        request.env['omniauth.auth']
        end
    

end