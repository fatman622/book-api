class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :autor
      t.string :text

      t.timestamps
    end
  end
end
