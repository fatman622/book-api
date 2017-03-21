class Book < ApplicationRecord
	validates :text, :autor, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }
end

