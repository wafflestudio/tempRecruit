class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.integer :applicant_id

      t.timestamps
    end
  end
end
