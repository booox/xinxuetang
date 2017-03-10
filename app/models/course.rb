class Course < ApplicationRecord

  has_many :posts
  has_many :sections
end
