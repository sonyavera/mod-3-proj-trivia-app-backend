class RemoveUsers < ActiveRecord::Migration[6.0]
    def change
      drop_table :users do |t|
        t.string :first_name, null: false
        t.string :last_name, null: false
        t.string :username, null: false
        t.string :email, null: false
        t.timestamps null: false
        end
    end
end
