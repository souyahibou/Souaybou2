class JoinTableAtteneesUsersEvents < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Events, :Users do |t|
      t.references :Event, index: true
      t.references :User, index: true
    end
  end
end
