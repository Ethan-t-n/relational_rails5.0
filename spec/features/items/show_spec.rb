require 'rails_helper'

RSpec.describe "items show page", type: :feature do
    it 'shows the child(item) matching the id in the path including its attributes' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)


        visit "/items/#{nike.id}"

        expect(page).to have_content(nike.brand)
        expect(page).to have_content("Amount in stock: #{nike.amount_in_stock}")
        expect(page).to have_content("Is it available: #{nike.availability}")
        expect(page).to_not have_content(synergy.brand)
    end

    it 'displays a link at the top of the page that says Items Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)


        visit "/items/#{nike.id}"

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end

    it 'can click on the link and go to the Items Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)
        visit "/items/#{nike.id}"

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end


    it 'displays a link at the top of the page that says Retailstore Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)

        visit "/items/#{nike.id}"

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end

    it 'can click on the link and go to the Retailstore Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)

        visit "/items/#{nike.id}"

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'displays a link on the page that says Update Item and will redirect to /items/:item_id/edit' do

      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)

        visit "/items/#{nike.id}"

        within "#nav_links" do
            expect(page).to have_link("Update Item")
        end

        click_link 'Update Item'

        expect(current_path).to eq("/items/#{nike.id}/edit")
    end

    it 'has a link to delete the item' do

      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)

        visit "/items/#{nike.id}"

        within "#nav_links" do
            expect(page).to have_link("Delete Record Of This #{nike.brand}")
        end
    end

    it 'has a link to delete the item' do

      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike = target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)

        visit "/items/#{nike.id}"

        click_on "Delete Record Of This #{nike.brand}"

        expect(current_path).to eq('/items')
        expect(page).to_not have_content("nike")
    end
end
