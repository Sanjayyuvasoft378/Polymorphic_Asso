class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :name, presence: true
  validates :imageable_id, numericality: {only_integer: true}, presence: true
  validates :imageable_type, presence: true

end
