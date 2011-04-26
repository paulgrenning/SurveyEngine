class CreateQuestionresults < ActiveRecord::Migration
  def self.up
    create_table :questionresults do |t|
      t.integer :answer
      t.integer :question_id

      t.timestamps
    end
    add_index :questionresults, :question_id
  end

  def self.down
    drop_table :questionresults
  end
end
