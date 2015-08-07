class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :meta_keywords
      t.string :meta_description
      t.string :title
      t.text :body
      t.string :slug
      t.string :template_name
      t.boolean :is_published,  default: false
      t.boolean :approved,      default: false
      t.datetime :publish_date
      t.references :created_by,  index: true, foreign_key: true
      t.references :changed_by,  index: true, foreign_key: true
      t.references :approved_by, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :pages, :slug,                    unique: true
  end
end
