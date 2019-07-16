class Test < ApplicationRecord

  enum type: [ :Git, :Rails ]

  validates :time, presence: true

end
