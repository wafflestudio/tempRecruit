class RenameTypeInQuestions < ActiveRecord::Migration
  def up
    rename_column :questions, :type, :answer_type
  end

  def down
    rename_column :questions, :answer_type, :type
  end
end
