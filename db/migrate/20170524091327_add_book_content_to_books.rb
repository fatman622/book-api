class AddBookContentToBooks < ActiveRecord::Migration[5.0]
 def self.up
    add_attachment :books, :book_content
  end

  def self.down
    remove_attachment :books, :book_content
  end
end
