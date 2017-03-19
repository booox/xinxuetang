class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.integer :post_id

      t.timestamps
    end
  end
end
