class CreateFish < ActiveRecord::Migration[6.1]
  def change
    create_table :fish do |t|
      t.string :species
      t.string :color
      t.float :weight

      t.timestamps
    end
  end
end
