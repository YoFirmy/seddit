require 'rails_helper'

RSpec.describe Post, type: :model do
  user = create_user
  subject {
    described_class.new(message: "Here's a message",
                        user_id: user.id)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a message" do
    subject.message = nil
    expect(subject).to_not be_valid
  end
end
