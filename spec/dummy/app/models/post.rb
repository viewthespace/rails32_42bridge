class Post < ActiveRecord::Base
  has_many :comments, inverse_of: :post, conditions: {removed: false}, order: 'comments.position'
  has_many :user_posts
  #in our pretend world, posts have many users.. i am not that creative
  has_many :users, through: :user_posts, uniq: true
end
