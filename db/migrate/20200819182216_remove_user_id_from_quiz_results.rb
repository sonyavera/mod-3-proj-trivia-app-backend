class RemoveUserIdFromQuizResults < ActiveRecord::Migration[6.0]
  def change
    remove_column :quiz_results, :user_id
  end
end
