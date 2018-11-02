class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :title
      t.text :description
      t.belongs_to :portfolio, foreign_key: true
      t.boolean :isPublic, default: false

      t.timestamps
    end
  end
end
