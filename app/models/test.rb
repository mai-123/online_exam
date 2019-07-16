class Test < ApplicationRecord
  enum type: [:git, :rails]

  validates :time, presence: true
end
