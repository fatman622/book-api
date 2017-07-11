class BookSerializer < ActiveModel::Serializer
	attributes :id, :author, :text, :available, :pages, :genre, :name, :number
end