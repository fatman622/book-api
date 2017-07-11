require 'elasticsearch/model'

class Book < ApplicationRecord
	Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include ElasticMyAnalyzer

	validates :text, :author, :pages, :genre, :name, :number, presence: true
	validates :available, inclusion: { in: [ true, false ] }
	# has_attached_file :book_content
	# validates :book_content, attachment_content_type: { content_type: ['text/plain']}
	
	scope :author, lambda {|author| where("LOWER(author) like ?", "#{author}%")}
	scope :available, -> (available) { where available: available }

	settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :text, type: 'string', analyzer: 'my_analyzer'
      indexes :author, type: 'string', analyzer: 'my_analyzer'
    end
  end

	def self.search(query)
	  __elasticsearch__.search(
	    {
	      query: {
	        multi_match: {
	          query: query,
	          fields: ['text^5', 'author^10']
	        }
	      }
	    }
	  )
	end
end

Book.import force: true

