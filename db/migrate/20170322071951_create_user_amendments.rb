class CreateUserAmendments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_amendments do |t|
      t.integer :user_id
      t.integer :amendment_id

      t.timestamps
    end
  end
end
