class CreateEducators < ActiveRecord::Migration[6.0]
  def change
    create_table :educators do |t|
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.string :class
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
    add_index :educators, :user_id
    add_index :educators, :account_id
  end
end
