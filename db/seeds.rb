# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Mechanic.all.each do |mechanic|
#   (1..5).each do |day_index|
#     day = Date::DAYNAMES[day_index % 7] # Cycle through days (e.g., Monday to Friday)
    
#     start_time = Time.parse('09:00 AM')
#     end_time = Time.parse('05:00 PM')

#     current_time = start_time

#     while current_time < end_time do
#       # Create an appointment for the time slot
#       availability = Availability.create(
#         mechanic: mechanic,
#         day: day,
#         start_time: current_time,
#         end_time: current_time + 1.hour
#       )

#       puts "Appointment created for #{mechanic.name} on #{day} from #{current_time} to #{current_time + 1.hour}"

#       current_time += 1.hour
#     end
#   end
# end