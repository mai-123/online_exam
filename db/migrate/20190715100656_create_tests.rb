class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :type
      t.string :name
      t.integer :time
      t.integer :total_question

      t.timestamps
    end
  end
end
