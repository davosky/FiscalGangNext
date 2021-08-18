class AddCallUpdaterToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :first_call_updater, :string
    add_column :requests, :second_call_updater, :string
    add_column :requests, :third_call_updater, :string
  end
end
