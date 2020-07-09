class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.text :name, null: false
      t.text :sex, limit: 1
      t.text :description, null: false
      t.timestamps
    end
  end
end
