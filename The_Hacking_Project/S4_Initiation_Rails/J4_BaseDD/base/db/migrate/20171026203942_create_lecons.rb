class CreateLecons < ActiveRecord::Migration[5.1]
  def change
    create_table :lecons do |t|

      t.timestamps
    end
  end
end
