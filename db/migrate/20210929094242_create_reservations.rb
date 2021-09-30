class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :store_id
      t.date :treatment_day
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.integer :staff_id
      t.integer :guest_id
      t.datetime :reservation_time
      t.boolean :holiday_flag

      t.timestamps
    end
  end
end
