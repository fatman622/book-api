class BookContent < ApplicationRecord
	validates :text, presence: true
end
