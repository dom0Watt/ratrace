class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.string :userName
      t.string :password
      t.string :token

      t.timestamps
    end
  end
end
