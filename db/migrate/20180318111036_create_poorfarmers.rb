class CreatePoorfarmers < ActiveRecord::Migration[5.0]
  def change
    create_table :poorfarmers do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.string :image
      t.string :helper

      t.timestamps
    end
  end
end
