class Product < ApplicationRecord
    has_many :pictures, as: :iamgeable

    validates :name, presence: true
end
