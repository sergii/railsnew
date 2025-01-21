class CreateGeneratorOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :generator_options do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.jsonb :options, null: false, default: {}
      t.text :description
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
    add_index :generator_options, :name, unique: true
    add_index :generator_options, :slug, unique: true
    add_index :generator_options, :options, using: :gin
  end
end
