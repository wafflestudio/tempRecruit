class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :type
      t.integer :period_id

      t.timestamps
    end
  end
end
