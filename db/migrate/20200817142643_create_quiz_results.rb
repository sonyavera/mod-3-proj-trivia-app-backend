class CreateQuizResults < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
