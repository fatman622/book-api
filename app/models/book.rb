class Book < ApplicationRecord
	validates :text, :autor, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :autor, -> (autor) { where autor: autor }
	scope :available, -> { where available: true }
end

