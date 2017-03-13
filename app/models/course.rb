class Course < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :posts, through: :sections
end
