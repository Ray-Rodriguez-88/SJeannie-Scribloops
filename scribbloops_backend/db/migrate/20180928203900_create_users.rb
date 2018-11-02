class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :user_type
      t.string :education_level, default: 'N/A'
      t.boolean :isOnline, default: false
      t.boolean :isWriter, default: false
      t.boolean :isAdmin, default: false
      t.boolean :isAdvisor, default: false
      t.float :writer_rating, default: 5.0
      t.float :advisor_rating, default: 5.0

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
