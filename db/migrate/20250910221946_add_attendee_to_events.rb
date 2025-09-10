class AddAttendeeToEvents < ActiveRecord::Migration[8.0]
  def change
    add_reference :events, :attendee, null: true, foreign_key: { to_table: :users }
  end
end
