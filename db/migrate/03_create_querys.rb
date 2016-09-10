class CreateQuerys < ActiveRecord::Migration

    def change
      create_table :querys do |t|
        t.string :content
        t.integer :user_id
      end
    end

end
