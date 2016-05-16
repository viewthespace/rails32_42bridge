class AddPositionToComments < ActiveRecord::Migration
  def change
    add_column :comments, :position, :integer, default: 0
  end
end
