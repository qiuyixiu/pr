class AddCategoryToPoorfarmer < ActiveRecord::Migration[5.0]
  def change
    add_column :poorfarmers, :category, :string
  end
end
