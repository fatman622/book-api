require 'rails_helper'

RSpec.describe Readme, type: :model do
	it { should validate_presence_of(:text) }
end
