class CreateAmendments < ActiveRecord::Migration

    def change
      create_table :amendments do |t|
        t.string :name
        t.text :content
        t.integer :user_id

        t.timestamps
      end
    end

end
