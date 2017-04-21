class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar_file_name, :first_name, :last_name
  belongs_to :user
end
