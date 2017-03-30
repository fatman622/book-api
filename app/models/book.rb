require 'elasticsearch/model'

class Book < ApplicationRecord
	Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
	validates :text, :author, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :author, lambda {|author| where("LOWER(author) like ?", "#{author}%")}
	scope :available, -> (available) { where available: available }
end
Book.import force: true
# Book.import

