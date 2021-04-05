require 'rails_helper'

RSpec.describe 'Search by Nation index page' do 
  before :each do 
    @total_members ||=AirbenderService.total_members("Fire Nation")
    visit root_path
    select "Fire Nation", :from => "nation"
    click_button "Search For Members"
  end
  describe "When I visit the Search index page for a specific nation" do 
    it "takes you to the Search For Members by nation index page" do 
      expect(current_path).to eq(search_path)
    end
    it "shows the nation you searched for and the total members" do 
      within "#nation" do 
        expect(page).to have_content("Members of the Fire Nation")
      end
      within "#totalMembers" do 
        expect(page).to have_content("Total Members: #{@total_members}")
      end
    end
  end
end