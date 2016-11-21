class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :content, presence: { message: "Story title is required" }

end
