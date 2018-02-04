class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    unless current_user.admin 
      render json: {message: "You must be an admin to access"}, status: :unauthorized
    end 
  end 

#knock makes this method for us 

  # def authenticate_user
  #   unless current_user
  #     render json: {message: "You must be logged in"}, status: :unauthorized
  #   end 

  # end 
end
