require 'rails_helper'

RSpec.describe ItemFactory do
  let(:factory) { ItemFactory.new name: 'minca', tags: %w|ramen evill| }
  before { factory.run }

  example { expect(Item.last.name).to eq('minca') }
  example { expect(Tag.count).to eq(2) }

  it "does not create duplicate tags" do
    ItemFactory.new(name: 'santouka', tags: %w|ramen wancowa|).run

    expect(Tag.where(name: 'ramen').count).to eq(1)
  end
end
