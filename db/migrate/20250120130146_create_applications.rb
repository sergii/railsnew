class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.string :rails_version, null: false
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :repository_url
      t.string :status, default: "draft"
      t.references :generator_option, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
    add_index :applications, :name
    add_index :applications, :slug, unique: true
  end
end
