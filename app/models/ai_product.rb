class AiProduct < ApplicationRecord
	before_create :generate_uuid
	belongs_to :ai_product_sort
	
end
