class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :value

      t.timestamps null: false
    end
  end
end
