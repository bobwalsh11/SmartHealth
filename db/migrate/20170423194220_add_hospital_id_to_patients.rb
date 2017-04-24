class AddHospitalIdToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :hospital_id, :integer
  end
end
