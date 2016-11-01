class CreateAttendingChurches < ActiveRecord::Migration[5.0]
  def change
    create_table :attending_churches do |t|
      t.string :name
      t.string :main_leader
      t.references :volunteer, foreign_key: true

      t.timestamps
    end
  end
end
