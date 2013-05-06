class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.datetime :start_date
      t.datetime :due_date
      t.integer :id

      t.timestamps
    end
  end
end
