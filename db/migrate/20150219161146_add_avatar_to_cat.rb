class AddAvatarToCat < ActiveRecord::Migration
	def self.up
		add_attachment :cats, :avatar
  end

  def self.down
		remove_attachment :cats, :avatar
  end
end