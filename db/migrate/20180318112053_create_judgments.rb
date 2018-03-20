class CreateJudgments < ActiveRecord::Migration[5.0]
  def change
    create_table :judgments do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
