require 'rails_helper'

RSpec.describe ItemCreation do
  it "works" do
    creation = ItemCreation.new name: 'minca', tags: %w|ramen evill|
    creation.save
  end
end
