class Assignment < ApplicationRecord
  belongs_to :post
  has_many :tasks, dependent: :destroy
end
