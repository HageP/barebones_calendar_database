class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :day_of_week
      t.integer :apartment_id
      t.integer :tenant_id
      t.integer :status_id
      t.integer :lease_id
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :resourceid

      t.timestamps

    end
  end
end
