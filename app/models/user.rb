class User < ActiveRecord::Base
  has_many :posts
  default_scope order: 'id DESC'
end
