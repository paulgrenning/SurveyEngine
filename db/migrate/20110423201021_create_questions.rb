class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :content
      t.integer :survey_id

      t.timestamps
    end
    add_index :questions, :survey_id
  end

  def self.down
    drop_table :questions
  end
end
