require 'rspec'
require_relative '../lib/room'

RSpec.describe Room do
  it 'has a name' do
    room = Room.new('bathroom')

    expect(room.name).to eq('bathroom')
  end
end
