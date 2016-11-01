class AddTermsToReceiveToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :terms_to_receive, :boolean
  end
end
