class AddNicknameToQuizResults < ActiveRecord::Migration[6.0]
  def change
    add_column :quiz_results, :nickname, :string
  end
end
