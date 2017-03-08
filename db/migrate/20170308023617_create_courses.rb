class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :create_user_id
      t.text :goal
      t.text :needs
      t.text :string
      t.text :description

      t.timestamps
    end
  end
end
