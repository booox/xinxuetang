class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :creator_id
      t.text :goal
      t.text :needs
      t.text :description
      t.text :hint

      t.timestamps
    end
  end
end
