module VehiclesHelper
  def find_associated_user(vehicle_id)
    subscriber = Subscriber.find_by(vehicle_id: vehicle_id)
    if subscriber.present?
      "Subscriber ID: #{subscriber.id}"
    else
      "No Subscriber"
    end
  end
end