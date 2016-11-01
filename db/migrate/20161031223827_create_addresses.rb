class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
