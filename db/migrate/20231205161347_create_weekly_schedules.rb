class CreateWeeklySchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_schedules do |t|
      t.string :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
