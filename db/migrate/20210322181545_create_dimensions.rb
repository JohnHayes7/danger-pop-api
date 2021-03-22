class CreateDimensions < ActiveRecord::Migration[6.1]
  def change
    create_table :dimensions do |t|
      t.integer :height
      t.integer :width
      t.string :measurement
      t.timestamps
    end
  end
end
