class AddDetailsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :details, :string
  end
end
