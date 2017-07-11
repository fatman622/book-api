class AddHGenreeNameNumberToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :genree, :string
    add_column :books, :name, :string
    add_column :books, :number, :integer
  end
end
