require 'elasticsearch/model'

class Book < ApplicationRecord
	Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
	validates :text, :author, :pages, presence: true
	validates :available, inclusion: { in: [ true, false ] }

	scope :author, lambda {|author| where("LOWER(author) like ?", "#{author}%")}
	scope :available, -> (available) { where available: available }

	def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['text^10', 'author']
        }
      },
      highlight: {
        pre_tags: ['<em>'],
        post_tags: ['</em>'],
        fields: {
          text: {},
          author: {}
        }
      }
    }
  )
end
end
Book.import force: true

