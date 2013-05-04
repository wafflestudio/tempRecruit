class AddStatusToApplicants < ActiveRecord::Migration
  def up
    add_column :applicants, :status, :string, :default => "INCOMPLETE"

    Applicant.all.each do |appl|
      appl.status = "INCOMPLETE"
      appl.save
    end


  end

  def down
    remove_column :applicants, :status
  end
end
