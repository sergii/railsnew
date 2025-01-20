class CreateTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :templates do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :path
      t.text :description

      t.timestamps
    end
    add_index :templates, :name, unique: true
    add_index :templates, :slug, unique: true
  end
end
