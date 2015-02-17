class AddEmailAndPassToCats < ActiveRecord::Migration
  def up
  	add_column :cats, :email, :string
  	add_column :cats, :password_digest, :string
		add_index :cats, :email, unique: true
  end

  def down
  	remove_column :cats, :email
  	remove_column :cats, :password_digest
  	remove_index :cats, :email
  end
end
