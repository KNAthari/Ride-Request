class CreateRideRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :ride_requests do |t|
      t.string :name
      t.string :email
      t.datetime :pickup_time
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
