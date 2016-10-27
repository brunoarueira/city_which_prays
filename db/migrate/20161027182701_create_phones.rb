class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.integer :ddd
      t.string :number
      t.integer :kind
      t.integer :volunteer_cellphone_id
      t.integer :volunteer_residential_phone_id
      t.boolean :whatsapp, default: false

      t.timestamps
    end

    add_foreign_key :phones, :volunteers, column: :volunteer_cellphone_id
    add_foreign_key :phones, :volunteers, column: :volunteer_residential_phone_id

    add_index :phones, :volunteer_cellphone_id
    add_index :phones, :volunteer_residential_phone_id
  end
end
