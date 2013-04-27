class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :university
      t.string :department
      t.string :year

      t.timestamps
    end
  end
end
