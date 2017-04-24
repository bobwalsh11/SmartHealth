class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :hospital
      t.string :department
      t.text :comment
      t.date :date

      t.timestamps
    end
  end
end
