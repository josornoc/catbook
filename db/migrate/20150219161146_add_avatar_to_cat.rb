class AddAvatarToCat < ActiveRecord::Migration
  def change
  	def self.up
			add_attachment :cats, :avatar
	  end

	  def self.down
			remove_attachment :cats, :avatar
	  end
  end
end
