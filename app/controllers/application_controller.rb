class ApplicationController < ActionController::API
    before_action :authorize, except: [:home]
    def current_user 
        current_user = User.find_by(id: session[:user_id])
    end 

    def authorize
        if !current_user
            #method 1
            authorization_failure = { "authorized" => "no" }
            render :json => authorization_failure, status: :unauthorized
            #method 2
            # redirect_to login_path
        end
    end
end
