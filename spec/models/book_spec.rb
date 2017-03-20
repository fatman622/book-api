require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:autor) }
  it { should validate_presence_of(:pages) }
 	it { should validate_presence_of(:available) }
end