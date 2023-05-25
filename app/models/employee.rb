class Employee < ApplicationRecord
    has_many :pictures, as: :iamgeable
    validates :name, presence: true, length: { minimum: 3, maximum: 15 }, uniqueness: true
end
