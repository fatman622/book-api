class Book < ApplicationRecord
	validates :text, :autor, :pages, :available, presence: true
end

