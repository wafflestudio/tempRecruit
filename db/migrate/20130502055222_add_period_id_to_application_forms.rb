class AddPeriodIdToApplicationForms < ActiveRecord::Migration
  def change
    add_column :application_forms, :period_id, :integer
  end
end
