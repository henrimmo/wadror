require 'rails_helper'

RSpec.describe Beer, type: :model do
  
  it "is saved with name and style" do
  	beer = Beer.create name:"Kalja", style:"IPA"

  	expect(beer.valid?).to be(true)
  	expect(Beer.count).to eq(1)
  end

  it "is not saved witout name" do
  	beer = Beer.create style:"IPA"

  	expect(beer.valid?).to be(false)
  	expect(Beer.count).to eq(0)
  end

  it "is not saved without style" do
  	beer = Beer.create name:"Kalja"

  	expect(beer.valid?).to be(false)
  	expect(Beer.count).to eq(0)
  end


end
