class Task < ApplicationRecord

  belongs_to :assignment
  has_many :answers, dependent: :destroy
end
