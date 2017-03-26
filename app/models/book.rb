class Book < ApplicationRecord
	validates :text, :author, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	# scope :author, -> (author) { where author: author }
	scope :author, lambda {|author| where("author like ?", "#{author}%")}
	scope :available, -> (available) { where available: available }
end

