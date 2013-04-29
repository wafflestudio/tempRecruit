class AddCategoryToApplicationForms < ActiveRecord::Migration
  def change
    add_column :application_forms, :category, :string
  end
end
