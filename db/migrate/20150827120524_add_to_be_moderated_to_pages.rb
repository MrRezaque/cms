class AddToBeModeratedToPages < ActiveRecord::Migration
  def change
    add_column :pages, :to_be_moderated, :boolean, default: false, null: false
  end
end
