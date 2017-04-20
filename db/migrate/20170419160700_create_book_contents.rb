class CreateBookContents < ActiveRecord::Migration[5.0]
  def change
    create_table :book_contents do |t|
      t.timestamps
    end
  end
end
