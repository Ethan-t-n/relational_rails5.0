require 'rails_helper'

RSpec.describe 'the creation of a new Retailstore' do
    it 'has a clickable link new retailstores that brings the user to /retailstores/new' do
        visit '/retailstores'

        click_link('New Retailstore')

        expect(current_path).to eq('/retailstores/new')
    end

    it 'can create a new retailstores' do
        visit '/retailstores/new'

        fill_in('name', with: "REI")
        fill_in('location', with: "Denver")
        fill_in('total_items_in_stock', with: 4352)
        select(true, from: 'open_for_day')

        click_button('Create Retailstore')

        expect(current_path).to eq('/retailstores')
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

        visit "/retailstores/new"

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

        visit '/retailstores/new'

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

        visit "/retailstores/new"

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

        visit "/retailstores/new"

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end
end
