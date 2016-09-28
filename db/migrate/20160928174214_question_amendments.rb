class QuestionAmendments < ActiveRecord::Migration

  def change
    create_table :question_amendments do |t|
      t.integer :question_id
      t.integer :amendment_id

      t.timestamps
    end
  end

end
