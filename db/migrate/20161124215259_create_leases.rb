class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.date :lease_start
      t.date :lease_end
      t.integer :tenant_id
      t.integer :apartment_id

      t.timestamps

    end
  end
end
