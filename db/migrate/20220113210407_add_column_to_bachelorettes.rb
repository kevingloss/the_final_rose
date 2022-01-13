class AddColumnToBachelorettes < ActiveRecord::Migration[5.2]
  def change
    add_column :bachelorettes, :season, :string
  end
end
