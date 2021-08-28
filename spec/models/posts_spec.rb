require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.message = "Here's a message"
    expect(subject).to be_valid
  end

  it "is not valid without a message" do
    post = Post.new(message: nil)
    expect(post).to_not be_valid
  end
end
