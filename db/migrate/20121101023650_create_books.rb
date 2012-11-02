class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :subject
      t.integer :page_count

      t.timestamps
    end
  end
end
