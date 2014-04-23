class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :display_name, null: false
      t.timestamps
    end
  end
end
