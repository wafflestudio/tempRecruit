class AddCellPhoneToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :cell_phone, :integer
  end
end
