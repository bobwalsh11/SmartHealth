class AddUserIdToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :user_id, :integer
  end
end
