class RenameApplicantIdInAnswers < ActiveRecord::Migration
  def up
    rename_column :answers, :applicant_id, :application_form_id
  end

  def down
    rename_column :answers, :application_form_id, :applicant_id
  end
end
