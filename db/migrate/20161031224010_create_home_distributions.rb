class CreateHomeDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :home_distributions do |t|
      t.boolean :except_homes
      t.boolean :numbers_from_buildings
      t.string :number_from_homes_to_distribute
      t.boolean :deliver_on_building_for_all
      t.string :building_name
      t.references :volunteer, foreign_key: true

      t.timestamps
    end
  end
end
