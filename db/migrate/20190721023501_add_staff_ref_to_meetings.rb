class AddStaffRefToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :staff, foreign_key: true
  end
end
