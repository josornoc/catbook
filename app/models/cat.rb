class Cat < ActiveRecord::Base

  has_secure_password
  
  validates :name, presence: true, length: { in: 2..255 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_attached_file :avatar, styles:{:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :visible, -> { where(visible: true) }
  scope :hidden,  -> { where(visble: false) }

  # More info
  # http://guides.rubyonrails.org/association_basics.html
  # https://www.railstutorial.org/book/frontmatter
  # http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_many
  # http://stackoverflow.com/questions/5856838/scope-with-join-on-has-many-through-association
  has_many :follower_relations
  has_many :followed_relations, class_name: "FollowerRelation", foreign_key: "followed_cat_id"

  has_many :followers,    -> { visible }, through: :follower_relations, source: :followed
  has_many :followed_by,  -> { visible }, through: :followed_relations, source: :cat

end
