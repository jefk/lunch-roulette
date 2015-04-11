require 'rails_helper'

RSpec.describe ItemFactory do
  it "works" do
    creation = ItemFactory.new name: 'minca', tags: %w|ramen evill|
    creation.run
  end
end
