class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :details
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
