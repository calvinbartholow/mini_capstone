class UserTokenController < Knock::AuthTokenController
  def create
    render json: {
      jwt: auth_web.token,
      admin: user.find_by(email: params[:auth][:email]).admin
    }, 
    status: :created
  end 
end
