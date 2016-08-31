class Api::V1::SessionsController < Api::V1::BaseController
  def create
    uparams = user_params

    user = User.find_by(email: uparams[:email])

    if user && user.authenticate(uparams[:password])
      self.current_user = user

      render(
        json: Api::V1::SessionSerializer.new(user, root: false),
        status: 201)
    else
      return api_error(status: 401)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
