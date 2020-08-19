class UsersController < ApplicationController
    # skip_before_action :authorize, only: [:signup, :create]

    # def create
    #     user = User.new(user_params)
    #     if user.valid? 
    #         user.save
    #         session[:user_id] = user.id
            
    #         success_message = {
    #             "valid" => "y",
    #             "message" => "Thanks for joining!"
    #         }
    #         render :json => success_message
    #         # flash[:success] = "Thanks for joining!"
    #     else   
    #         # flash[:errors] = user.errors.full_messages
    #         # redirect_to signup_path
    #         fail_message = {
    #             "valid" => "n",
    #             "message" => "Please be sure to fill out all fields and use a unique username."
    #         }
    #         render :json => fail_message
    #     end
    # end

    # def signup

    # end

    # def account
    #     @user = User.find_by(id: session[:user_id])
    # end

    # private

    # def user_params
    #     params.require(:user).permit(:first_name, :last_name, :username, :email)
    # end

    # def set_user
    #     @user = User.find(params[:id])
    # end

end
