class Post < ApplicationRecord
  belongs_to :section
  has_many :tasks, dependent: :destroy
end
