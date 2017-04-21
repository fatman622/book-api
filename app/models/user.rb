class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  after_create :setup_profile

	protected
  def setup_profile
    profile = self.create_profile # or Profile.create(user_id: self.id)
  end
end
