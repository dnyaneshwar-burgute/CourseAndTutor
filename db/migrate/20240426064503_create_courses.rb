class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :code
      t.integer :level
      t.float :price

      t.timestamps
    end
  end
end
