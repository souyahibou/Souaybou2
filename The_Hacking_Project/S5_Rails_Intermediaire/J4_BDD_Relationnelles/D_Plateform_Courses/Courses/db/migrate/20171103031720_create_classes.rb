class CreateClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :classes do |t|
      t.string :level

      t.timestamps
    end
  end
end
