class AddTextToBookContents < ActiveRecord::Migration[5.0]
  def change
    add_column :book_contents, :text, :string
  end
end
