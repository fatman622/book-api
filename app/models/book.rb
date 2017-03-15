class Book < ApplicationRecord
	validates :text, :autor, presence: true
end

