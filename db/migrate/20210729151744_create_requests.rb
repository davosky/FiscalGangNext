class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :name
      t.date :date
      t.references :practice, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :email
      t.boolean :subscriber
      t.references :category, foreign_key: true
      t.text :note
      t.references :operator, foreign_key: true

      t.timestamps
    end
  end
end
