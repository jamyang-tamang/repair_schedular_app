class AvailabilitiesController < ApplicationController
  def index
    if session[:subscriber].nil?
      puts "Redirecting to login_path"
      redirect_to login_path
    else
      puts "session[:subscriber] = #{session[:subscriber]}"
      vehicle_id = Subscriber.find_by(id: session[:subscriber]).vehicle_id
      @vehicle = Vehicle.find_by(id: vehicle_id)

      if(@vehicle.nil?)
        redirect_to vehicles_path
      else
        @market = @vehicle.market
        mechanic_from_users_current_market = []
        mechanics = Mechanic.all
        mechanics.each do |mechanic|
          if(mechanic.market_id == @market.id)
            mechanic_from_users_current_market << mechanic.id
          end
        end

        availabilities = Availability.where(mechanic_id: mechanic_from_users_current_market)
        @schedule_data = organize_schedule_data(availabilities)
      end
    end
  end

  def allot_to_user
    @availability = Availability.find_by_id(params[:availability_id])

    puts ":availability_id = #{params[:availability_id]}"
    puts ":subscriber_id = #{ params[:subscriber_id]}"
    @availability.update(alloted_to: params[:subscriber_id])
    redirect_to availabilities_path
  end


  def un_allot_to_user
    @availability = Availability.find_by_id(params[:availability_id])
    @availability.update(alloted_to: nil)
    redirect_to availabilities_path
  end
  
  
  private

  def organize_schedule_data(availabilities)
    schedule_data = {}

    availabilities.each do |availability|
      mechanic_name = availability.mechanic.name
      id = availability.id
      day = availability.day
      
      start_time = availability.start_time.in_time_zone('Eastern Time (US & Canada)').strftime('%l:%M %p')
      end_time = availability.end_time.in_time_zone('Eastern Time (US & Canada)').strftime('%l:%M %p')
      alloted_to = availability.alloted_to

      # Create nested hash structure
      schedule_data[mechanic_name] ||= {}
      schedule_data[mechanic_name][day] ||= []
      schedule_data[mechanic_name][day] << { id: id, start_time: start_time, end_time: end_time, alloted_to: alloted_to }
    end

    schedule_data
  end
end