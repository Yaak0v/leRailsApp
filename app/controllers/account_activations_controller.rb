class AccountActivationsController < ApplicationController
def edit
    user = User.find_by(email: params[:email])
    if user && user.authenticated?(:activation, params[:id])
    # activate the user
    else
        #handle invalid link
    end
end

end
