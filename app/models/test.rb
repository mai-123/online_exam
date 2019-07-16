class Test < ApplicationRecord

  enum type: [ ruby: 'Ruby', git: 'Git', rails: 'Rails' ]

  validates :time, presence: true

end
