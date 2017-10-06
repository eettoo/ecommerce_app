class Order < ApplicationRecord

	belongs_to :user
	has_many :items_paids, dependent: :destroy
	validates(:payment_status, presence: true)
	validates(:ship_date, presence: true)
	validates(:ship_status, presence: true)
	validates(:payment_date, presence: true)


end