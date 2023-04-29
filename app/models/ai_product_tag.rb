class AiProductTag < ApplicationRecord
  before_create :generate_uuid
  has_many :ai_product_and_tags
  has_many :ai_products, through: :ai_product_and_tags
end
