class CreatePageHierarchies < ActiveRecord::Migration
  def change
    create_table :page_hierarchies, id: false do |t|
      t.integer :page_id, null: false
      t.integer :parent_id, null: false


      t.timestamps null: false
    end
  end
end
