class Test < ApplicationRecord
  CATEGORY_TYPE = [:git, :rails]

  enum type: CATEGORY_TYPE

  validates :time, presence: true
  validates :name, presence: true
  validates :type, presence: true
end
