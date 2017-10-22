class CreateDraftUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :draft_users do |t|
      t.string :username
      t.integer :role
      t.timestamps
    end

    add_column :users, :draft_user_id, :integer
    add_index :users, :draft_user_id
  end
end
