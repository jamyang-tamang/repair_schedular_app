class SessionsController < ApplicationController
  def new
  end

  def create
    subscriber = Subscriber.find_by(email: params[:subscriber][:email])
    Rails.logger.debug "Password: #{params[:subscriber][:email]}"
    
    if subscriber && subscriber.authenticate(params[:subscriber][:password])
      session[:subscriber] = subscriber.id
      puts "Authentication passed!"
      redirect_to root_url
    else
      puts "Authentication failed!"
      redirect_to login_path, notice: "Authentication failed!"
    end
  end

  def destroy
    session[:subscriber] = nil
    puts "Logging out!"
    redirect_to root_url, notice: "Logged out successfully!"
  end
end
