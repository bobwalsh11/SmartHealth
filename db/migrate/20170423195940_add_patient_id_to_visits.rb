class AddPatientIdToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :patient_id, :integer
  end
end
