class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :course_id
      t.integer :creator_id
      t.text :content

      t.timestamps
    end
  end
end
