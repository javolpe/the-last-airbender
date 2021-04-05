require 'rails_helper'

RSpec.describe 'Search by Nation index page' do 
  before :each do 
    @total_members ||=AirbenderService.total_members("Fire Nation")
    @first_25 ||=AirbenderService.first_25_members("Fire Nation")
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
    it "displays the first 25 members of the nation and their detials" do 
      expect(@first_25.size).to eq(25)
      expect(page).to have_content(@first_25.first.name)
      expect(page).to have_content(@first_25.first.affiliation)
      expect(page).to have_content(@first_25.first.allies.first)
      expect(page).to have_content(@first_25.first.enemies.first)
      
      expect(page).to have_content(@first_25.third.name)
      expect(page).to have_content(@first_25.third.affiliation)
      expect(page).to have_content(@first_25.third.allies.first)
      expect(page).to have_content(@first_25.third.enemies.first)
      
      expect(page).to have_content(@first_25.last.name)
      expect(page).to have_content(@first_25.last.allies.first)
      expect(page).to have_content(@first_25.last.enemies.first)
    end
  end
end