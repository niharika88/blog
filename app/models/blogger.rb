class Blogger < ActiveRecord::Base
	has_many :paragraphs
	scope :by_date, -> { order(created_at: :desc) }
end
