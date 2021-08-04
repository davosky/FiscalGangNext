class AddColumnToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :processed, :boolean, default: false
    add_column :requests, :updater, :string
  end
end
