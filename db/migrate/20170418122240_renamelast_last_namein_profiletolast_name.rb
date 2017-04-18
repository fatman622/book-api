class RenamelastLastNameinProfiletolastName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :profiles, :last_last_name, :last_name
  end
end
