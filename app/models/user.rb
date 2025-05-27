class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id', inverse_of: :creator
  has_many :post_editors, dependent: :destroy
  has_many :edited_posts, through: :post_editors, source: :post
  
end
