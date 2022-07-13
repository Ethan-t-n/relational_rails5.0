require 'rails_helper'

RSpec.describe 'can create a new item for a specific retailstores' do
    it 'has a clickable link new item that brings the user to /retailstores/retailstores_id/items/new' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        click_link('Create Item')

        expect(current_path).to eq("/retailstores/#{retailstores_1.id}/items/new")
    end

    it 'can create an item for the specific retailstores' do
        retailstores_1 = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)

        visit "/retailstores/#{retailstores_1.id}/items/new"

        fill_in('brand', with: "nike")
        fill_in('Amount in stock', with: 40)
        select(true, from: 'Availability')

        click_button("Create Item")

        expect(current_path).to eq("/retailstores/#{retailstores_1.id}/items")
        expect(page).to have_content("nike")
        expect(page).to have_content("40")

    end

    it 'displays a link at the top of the page that says Items Index' do
        Item.destroy_all
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}"

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end

    it 'can click on the link and go to the Items Index' do
        Item.destroy_all
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}"

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end

    it 'displays a link at the top of the page that says Retailstore Index' do
        Item.destroy_all
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}"

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end

    it 'can click on the link and go to the Retailstore Index' do
        Item.destroy_all
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}"

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'displays a link at the top of the page that says go to this retailstores items index' do
        Item.destroy_all
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}"

        within "#nav_links" do
            expect(page).to have_content("This Retailstores Items Index")
        end
    end

    it 'can click on the link and go to the retailstores specific item index' do
        Item.destroy_all
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        retailstores_1.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}"

        click_link 'This Retailstores Items Index'

        expect(current_path).to eq("/retailstores/#{retailstores_1.id}/items")
    end
end
