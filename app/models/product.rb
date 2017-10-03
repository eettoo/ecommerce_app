class Product < ApplicationRecord

	validates(:name, presence: true)
	validates(:description, presence: true)
	validates(:price, presence: true)
	validates(:gender, presence: true)
	validates(:category, presence: true)
	validates(:quantity, presence: true)

end