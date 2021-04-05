require 'rails_helper'

RSpec.describe 'Search by Nation index page' do 
  before :each do 
    visit root_path
    select "Fire Nation", :from => "nation"
    click_button "Search For Members"
  end
  it "takes you to the Search For Members by nation index page" do 
    expect(current_path).to eq(search_path)
  end

end