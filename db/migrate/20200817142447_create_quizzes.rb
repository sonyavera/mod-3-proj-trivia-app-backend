class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :category
      t.string :difficulty

      t.timestamps
    end
  end
end
