
class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params) 
    @subscriber.vehicle_id = nil
    puts "Subscriber is being created!"
    if @subscriber.save
      session[:subscriber] = @subscriber.id
      redirect_to login_path
      puts "Subscriber created!"
    else
      message = @subscriber.errors.full_messages
      redirect_to signup_path, notice: message
    end
  end

  def show
    @subscriber = Subscriber.find_by_id(params[:id])
    redirect_to '/' if !@subscriber
  end

  def allot_vehicle_to_self
    @subscriber = Subscriber.find_by_id(session[:subscriber])
    @subscriber.update(vehicle_id: params[:vehicle_id])
    
    redirect_to availabilities_path
  end

  def un_allot_vehicle
    @subscriber = Subscriber.find_by_id(session[:subscriber])

    Availability.where(alloted_to: @subscriber.id).update_all(alloted_to: nil)
    @subscriber.update(vehicle_id: nil)

    redirect_to vehicles_path
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:email, :name, :password, :password_confirmation)
  end
end