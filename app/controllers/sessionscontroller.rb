class SessionsController < ApplicationController
    def create
      # Find a user in the database using the username from params
      user = User.find_by(username: params[:username])
  
      if user
        # Save the user's ID to the session hash
        session[:user_id] = user.id
        render json: user
      else
        render json: { error: "Invalid username" }, status: 404
      end
    end
  
    def destroy
      # Remove the user ID from the session hash
      session[:user_id] = nil
      head :no_content
    end
  end
  