class Section < ApplicationRecord
  has_many :posts

  belongs_to :course
end
