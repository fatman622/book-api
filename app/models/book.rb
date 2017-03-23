class Book < ApplicationRecord
	validates :text, :author, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :author, -> (author) { where author: author }
	scope :available, -> { where available: true }
	scope :all_params, -> (author, available) { where author: author, available: true }
end

