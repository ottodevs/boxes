require 'rails_helper'

RSpec.describe Site, type: :model do
  it "has a valid factory" do
    expect(site).to be_valid
  end
end