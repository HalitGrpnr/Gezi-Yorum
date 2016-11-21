class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :posts

  has_many :complains

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  acts_as_followable
  acts_as_follower
  def self.search(query)
# where(:title, query) -> This would return an exact match of the query
  where("name like ?", "%#{query}%")
  end

end
