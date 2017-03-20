class Book < ApplicationRecord
	validates :text, :autor, :pages, presence: true
end

