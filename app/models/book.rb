class Book < ApplicationRecord
	validates :autor, presence: true
	validates :text, presence: true
end

