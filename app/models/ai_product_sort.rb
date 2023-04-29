class AiProductSort < ApplicationRecord
	before_create :generate_uuid
	validates :uuid, uniqueness: true
	has_many :ai_products
end
