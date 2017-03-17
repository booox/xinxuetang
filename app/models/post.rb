class Post < ApplicationRecord


  belongs_to :course
  belongs_to :section

  has_many :assignments, dependent: :destroy
end
