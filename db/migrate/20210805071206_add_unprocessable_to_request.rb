class AddUnprocessableToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :unprocessable, :boolean, default: false
    add_column :requests, :unprocessable_reason, :text
  end
end
