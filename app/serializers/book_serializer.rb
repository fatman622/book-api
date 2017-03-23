class BookSerializer < ActiveModel::Serializer
	attributes :id, :author, :text, :available, :pages
end