class AddCategoryIdToPoorfarmer < ActiveRecord::Migration[5.0]
  def change
    add_column :poorfarmers, :category_id, :integer
  end
end
