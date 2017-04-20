require 'rails_helper'

RSpec.describe BookContent, type: :model do
 	it { should validate_presence_of(:text) }
end
