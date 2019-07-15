class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :image
      t.string :title
      t.integer :duration
      t.string :category
      t.string :level
      t.text :description

      t.timestamps
    end
  end
end
