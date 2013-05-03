class AddApplicantIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :applicant_id, :integer
  end
end
