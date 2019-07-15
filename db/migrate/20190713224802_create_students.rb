class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
    add_index :students, :user_id
    add_index :students, :account_id
  end
end
