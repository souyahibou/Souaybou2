class CreateStudentsClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :students_classes, id: false do |t|
      t.belongs_to :classe, foreign_key: true
      t.belongs_to :student, foreign_key: true

      t.timestamps
    end
  end
end

# create_table :assemblies_parts, id: false do |t|
#       t.belongs_to :assembly, index: true
#       t.belongs_to :part, index: true
#     end
