class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def generate_uuid
    self.uuid = SecureRandom.hex(16)
  end

  def generate_contact_code
    self.code = generate_random_string
  end

  def generate_random_string
    characters = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
    random_string = (0...8).map { characters[rand(characters.length)] }.join
  end

end
