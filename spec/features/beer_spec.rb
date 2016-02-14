require 'rails_helper'

describe 'Beer' do 
	before :each do
    FactoryGirl.create :brewery
  end

	it 'should not save with invalid name' do
		visit new_beer_path
		fill_in('beer_name', with:'Olut')
		select('IPA', from:'beer[style]')
		select('anonymous', from:'beer[brewery_id]')

		expect{
      click_button('Create Beer')
    	}.to change{Beer.count}.by(1)
	end

	it 'should show error when invalid name' do
		visit new_beer_path
		fill_in('beer_name', with:'')
		select('IPA', from:'beer[style]')
		select('anonymous', from:'beer[brewery_id]')

		click_button('Create Beer')
		save_and_open_page
		expect(page).to have_content "Name can't be blank"
	end
	
end