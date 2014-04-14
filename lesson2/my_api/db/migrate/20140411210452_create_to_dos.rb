class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.text :text

      t.timestamps
    end
  end
end
