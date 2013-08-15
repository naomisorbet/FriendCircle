class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :post_id, :null => false
      t.string :name, :null => false
      t.string :destination, :null => false

      t.timestamps
    end
    add_index :links, :post_id
  end
end
