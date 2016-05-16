class AddLatestToComments < ActiveRecord::Migration
  def change
    add_column :comments, :latest, :boolean
  end
end
