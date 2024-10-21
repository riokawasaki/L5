class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :uid
      t.string :pass

      t.timestamps
    end
  end
end
