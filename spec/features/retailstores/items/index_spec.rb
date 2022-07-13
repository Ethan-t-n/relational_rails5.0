require 'rails_helper'

RSpec.describe 'retailstores items index', type: :feature do
    it 'shows all the items for the specific retailstores' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        nike = retailstores_1.items.create!(brand: "nike",
                                            amount_in_stock: 0,
                                            availability: false)
        synergy = retailstores_1.items.create!(brand: "Synergy",
                                                amount_in_stock: 42,
                                                availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        expect(page).to have_content(nike.brand)
        expect(page).to have_content(synergy.brand)
    end

    it 'shows the items attributes for the specific retailstores' do
        retailstores_1 = Retailstore.create!(
                            name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(
                            name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)

        nike = retailstores_1.items.create!(brand: "nike",
                                            amount_in_stock: 0,
                                            availability: false)
        synergy = retailstores_1.items.create!(brand: "Synergy",
                                                amount_in_stock: 42,
                                                availability: true)
        kirkland = retailstores_2.items.create!(brand: "Kirkland",
                                        amount_in_stock: 72,
                                        availability: true)
        vega = retailstores_2.items.create!(brand: "Vega",
                                       amount_in_stock: 18,
                                       availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        expect(page).to have_content(nike.brand)
        expect(page).to have_content(nike.amount_in_stock)
        expect(page).to have_content(nike.availability)
        expect(page).to have_content(synergy.brand)
        expect(page).to have_content(synergy.amount_in_stock)
        expect(page).to have_content(synergy.availability)
        expect(page).to_not have_content(kirkland.brand)
        expect(page).to_not have_content(vega.brand)
    end

    it 'displays a link at the top of the page that says Items Index' do
        retailstores_1 = Retailstore.create!(id:1,
                            name: "Target",
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

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end

    it 'can click on the link and go to the Items Index' do
        retailstores_1 = Retailstore.create!(id:1,
                            name: "Target",
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

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end

    it 'displays a link at the top of the page that says Retailstore Index' do
        retailstores_1 = Retailstore.create!(id:1,
                            name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(id:2,
                            name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)

        retailstores_1.items.create!(brand: "nike",
                              amount_in_stock: 0,
                              availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)
        retailstores_2.items.create!(brand: "Kirkland",
                               amount_in_stock: 72,
                               availability: true)
        retailstores_2.items.create!(brand: "Vega",
                               amount_in_stock: 18,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end

    it 'can click on the link and go to the Retailstore Index' do
        retailstores_1 = Retailstore.create!(
                            name: "Target",
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

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'displays a link at the top of the page that says Sort Alphabetically' do
        retailstores_1 = Retailstore.create!(
                            name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(
                            name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)

        retailstores_1.items.create!(brand: "nike",
                              amount_in_stock: 0,
                              availability: false)
        retailstores_1.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)
        retailstores_2.items.create!(brand: "Kirkland",
                               amount_in_stock: 72,
                               availability: true)
        retailstores_2.items.create!(brand: "Vega",
                               amount_in_stock: 18,
                               availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        within "#nav_links" do
            expect(page).to have_content("Sort Alphabetically")
        end
    end

    it 'has an edit link next to every item' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true)
        item_3 = retailstores_1.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        item_4 = retailstores_1.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        expect(page).to have_link("Click Here To Edit This #{item_2.brand}")
        expect(page).to have_link("Click Here To Edit This #{item_4.brand}")
    end

    it 'after clicking edit next to item, taken to item edit page' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true)
        item_3 = retailstores_1.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        item_4 = retailstores_1.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        click_link "Click Here To Edit This Synergy"

        expect(current_path).to eq("/items/#{item_2.id}/edit")
    end

    it 'has a form section that says Only return records whose is more than X' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true)
        item_3 = retailstores_1.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        item_4 = retailstores_1.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        expect(page).to have_button("Only return records whose more than X")
    end

    it 'brings visitor back to the current index page with only the records that meet that threshold shown' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true)
        item_3 = retailstores_1.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        item_4 = retailstores_1.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        fill_in('number', with: "40")

        click_on('Only return records whose is more than X')

        expect(current_path).to eq("/retailstores/#{retailstores_1.id}/items")
        expect(page).to have_content(item_2.brand)
        expect(page).to have_content(item_4.brand)
        expect(page).to_not have_content(item_1)
        expect(page).to_not have_content(item_3)
    end

    it 'has an delete link next to every item' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true)
        item_3 = retailstores_1.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        item_4 = retailstores_1.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        expect(page).to have_link("Click Here To Delete This #{item_2.brand}")
        expect(page).to have_link("Click Here To Delete This #{item_4.brand}")
    end

    it 'after clicking delete next to item, taken to item index page' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true)
        item_3 = retailstores_1.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        item_4 = retailstores_1.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit "/retailstores/#{retailstores_1.id}/items"

        click_link "Click Here To Delete This Synergy"

        expect(current_path).to eq("/items")
        expect(page).to_not have_content("Synergy")
    end
end
