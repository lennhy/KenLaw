class CreateResults < ActiveRecord::Migration

    def change
      create_table :results do |t|
        t.text :content
        t.integer :query_id

        t.timestamps
      end
    end

end
