require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:pages) }
end