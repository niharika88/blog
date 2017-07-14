class Paragraph < ActiveRecord::Base
  belongs_to :blogger
  has_many :comments
end
