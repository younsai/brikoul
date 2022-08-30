class CreateBids < ActiveRecord::Migration[7.0]
  def change
    create_table :bids do |t|
      t.text :message
      t.float :price
      t.boolean :accepted, default: false
      t.references :user, null: false, foreign_key: true
      t.references :mission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
