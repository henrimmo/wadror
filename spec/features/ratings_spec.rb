require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')
  end

  it "when given, is registered to the beer and user who is signed in" do


    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end

  it "show the correct amount on index" do 


    
    click_button "Create Rating"
    visit ratings_path
    expect(page).to have_content "Number of ratings: 1" 
    expect(page).to have_content "iso 3 15"
  end

  it "show the correct amount on user page" do 


    
    click_button "Create Rating"
    expect(page).to have_content "Has 1 rating" 
    expect(page).to have_content "iso 3 15"
    

  end

  it "show the correct amount on user page when rating is deleted" do 


    
    click_button "Create Rating"
    click_link "delete"
    expect(page).to have_content "has not rated any beers" 
    

  end
end