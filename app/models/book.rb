# require 'elasticsearch/model'

class Book < ApplicationRecord
	# include Elasticsearch::Model
 #  include Elasticsearch::Model::Callbacks
	validates :text, :author, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :author, lambda {|author| where("LOWER(author) like ?", "#{author}%")}
	scope :available, -> (available) { where available: available }
end
# Book.import force: true

