class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|
      t.text :ops, :limit => 999999999
      t.belongs_to :document
      t.timestamps
    end
  end
end
