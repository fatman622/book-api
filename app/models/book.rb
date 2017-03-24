class Book < ApplicationRecord
	validates :text, :author, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :author, -> (author) { where author: author }
	scope :available, -> (available) { where available: available }
end

