class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def generate_uuid
    self.uuid = SecureRandom.hex(16)
  end

end
