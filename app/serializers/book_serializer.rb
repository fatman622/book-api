class BookSerializer < ActiveModel::Serializer
	attributes :id, :autor, :text, :available, :pages
end