class Book < ApplicationRecord
	validates :text, :autor, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :autor, -> (autor) { where autor: autor }
	scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
	scope :available, -> { where(available: [true]) }
end

