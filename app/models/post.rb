class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :complains

  acts_as_votable

  geocoded_by :address
  after_validation :geocode

  has_attached_file :avatar, styles: {medium: "700x500#", small: "350x250#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
