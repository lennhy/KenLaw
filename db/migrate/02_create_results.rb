class CreateResults < ActiveRecord::Migration

    def change
      create_table :results do |t|
        t.text :content
        t.integer :query_id
      end
    end

end
