class Section < ApplicationRecord
  belongs_to :course
  has_many :posts, dependent: :destroy
end
