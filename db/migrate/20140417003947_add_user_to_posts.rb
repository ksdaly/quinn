class AddUserToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.references :user, null: false
    end
  end
end
