class FixGenreName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :books, :genree, :genre
  end
end
