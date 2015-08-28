class AddIconToPages < ActiveRecord::Migration
  def change
    add_column :pages, :page_icon, :string
  end
end
