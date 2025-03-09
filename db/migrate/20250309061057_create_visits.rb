class CreateVisits < ActiveRecord::Migration[7.2]
  def change
    create_table :visits do |t|
      t.datetime :lastupdate
      t.datetime :scheduled_start
      t.datetime :scheduled_end
      t.datetime :time_in
      t.datetime :time_out
      t.datetime :actual_arrival
      t.datetime :actual_departure
      t.text :event_description
      t.string :event_title
      t.datetime :scheduled_at
      t.integer :duration
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
