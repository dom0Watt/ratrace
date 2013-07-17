class AddSelectClassToIdentification < ActiveRecord::Migration
  def change
    add_column :identifications, :selectClass, :boolean
  end
end
