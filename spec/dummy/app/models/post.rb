class Post < ActiveRecord::Base
  has_many :comments, inverse_of: :post, conditions: {removed: false}, order: 'comments.position'
end
