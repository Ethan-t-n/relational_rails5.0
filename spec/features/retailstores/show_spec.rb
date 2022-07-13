require 'rails_helper'

RSpec.describe "retailstores show page", type: :feature do
    it 'shows the parent(retailstores) matching the id in the path including its attributes' do
        target = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)
        walmart = Retailstore.create!(name: "Walmart",
            location: "Highlands Ranch",
            total_items_in_stock: 0,
            open_for_day: false)

        visit "/retailstores/#{target.id}"

        expect(page).to have_content(target.name)
        expect(page).to have_content("location: #{target.location}")
        expect(page).to have_content("total_items_in_stock: #{target.total_items_in_stock}")
        expect(page).to have_content("open_for_day?: #{target.open_for_day}")
        expect(page).to_not have_content(walmart.name)
    end

    it 'shows the count of the number of items associated with this retailstore' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)


        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

    

        expect(page).to have_content("This retailstore has #{target.item_count} items")
    end

    it 'displays a link at the top of the page that says Items Index' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end
    it 'can click on the link and go to the Items Index' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end

    it 'displays a link at the top of the page that says Retailstore Index' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end
    it 'can click on the link and go to the Retailstore Index' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'displays a link at the top of the page that says go to this retailstores items index' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)


        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

        within "#nav_links" do
            expect(page).to have_content("This Retailstores Items Index")
        end
    end

    it 'can click on the link and go to the retailstores specific item index' do
        Item.destroy_all
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"

        click_link 'This Retailstores Items Index'

        expect(current_path).to eq("/retailstores/#{target.id}/items")
    end

    it 'can delete a retailstores record' do
        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        walmart = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit "/retailstores/#{target.id}"

        within "#nav_links" do
            expect(page).to have_content("Delete Record Of This #{target.name}")
        end
    end

        it 'can delete a retailstores record' do
            target = Retailstore.create!(name: "Target",
                                location: "Lone Tree",
                                total_items_in_stock: 4352,
                                open_for_day: true)

            target.items.create!(brand: "nike",
                                amount_in_stock: 0,
                                availability: false)
            target.items.create!(brand: "Synergy",
                                amount_in_stock: 42,
                                availability: true)

            walmart = Retailstore.create!(name: "Walmart",
                                location: "Highlands Ranch",
                                total_items_in_stock: 0,
                                open_for_day: false)

            visit "/retailstores/#{target.id}"

            click_link "Delete Record Of This #{target.name}"

            expect(current_path).to eq("/retailstores")
            expect(page).to_not have_content("Target")
        end
end
