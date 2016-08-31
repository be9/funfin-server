class Account < ApplicationRecord
  extend Enumerize

  belongs_to :owner, class_name: 'User'

  has_ancestry
  enumerize :kind, in: %i(income expense asset liability)

  validates :name, presence: true
end
