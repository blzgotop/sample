class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :email
      t.text :desc

      t.timestamps
    end
  end
end
