class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:name, :email, :sex, :nationality, :residence)
    end
end
