module AvailibilitiesHelper
  def render_day_schedule(availability)
    if availability.present? && availability[:alloted_to].present?
      if(availability[:alloted_to] != session[:subscriber])
        "Not Available"
      else
        "Cancel Appointment"
      end
    else
      "Available"
    end
  end

  def take_appointment(availability)
      availability.update(availability.id)
      redirect_to view_item_path(params[:id])
  end

  def cancel_appointment(availability)
    availability.update(alloted_to: nil)
  end
end