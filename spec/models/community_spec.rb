# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Community, type: :model do
  subject { described_class.new(name: 'test_community') }

  it 'returns name instead of if for show params' do
    expect(subject.to_param).to eq(subject.name)
  end
end
