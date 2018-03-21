class CreateVillages < ActiveRecord::Migration[5.0]
  def change
    create_table :villages do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
