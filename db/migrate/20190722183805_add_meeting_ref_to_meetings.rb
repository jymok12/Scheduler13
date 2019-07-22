class AddMeetingRefToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :meeting, foreign_key: true
  end
end
