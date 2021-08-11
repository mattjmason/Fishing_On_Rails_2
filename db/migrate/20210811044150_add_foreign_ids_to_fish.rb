class AddForeignIdsToFish < ActiveRecord::Migration[6.1]
  def change
    add_column :fish, :angler_id, :integer
    add_column :fish, :location_id, :integer
  end
end
