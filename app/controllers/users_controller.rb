class UsersController < ApplicationController

    def create
        user = User.create(user_params)

        # redirect_to new_quiz_path
    end

    private

    def user_params
        params.require(:user).permit(:firstName, :lastName, :userName, :email)
    end

end
