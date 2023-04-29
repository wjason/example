class AiProduct < ApplicationRecord
	self.primary_key = :uuid
	before_create :generate_uuid
	belongs_to :ai_product_sort
	has_many :ai_product_and_tags
	has_many :ai_product_tags, through: :ai_product_and_tags
	
end
