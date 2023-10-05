class MyContactCard < ApplicationRecord
  attr_accessor :URLScheme
  before_create :generate_contact_code
  validates :code, uniqueness: true
end
