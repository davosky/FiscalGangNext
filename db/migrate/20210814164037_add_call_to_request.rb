class AddCallToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :first_call, :boolean
    add_column :requests, :second_call, :boolean
    add_column :requests, :third_call, :boolean
    add_column :requests, :first_call_date, :date
    add_column :requests, :second_call_date, :date
    add_column :requests, :third_call_date, :date
  end
end
