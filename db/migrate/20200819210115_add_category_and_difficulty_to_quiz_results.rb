class AddCategoryAndDifficultyToQuizResults < ActiveRecord::Migration[6.0]
  def change
    add_column :quiz_results, :category_id, :integer
    add_column :quiz_results, :category, :string
    add_column :quiz_results, :difficulty, :string
  end
end
