class AddPeriodIdToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :period_id, :integer
  end
end
