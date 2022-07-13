require 'rails_helper'

RSpec.describe 'updating a retailstores' do
    it 'has a clickable link edit retailstores that brings the user to /retailstores/retailstores_id/edit' do
        target = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)

        visit "/retailstores/#{target.id}"

        click_link("Edit #{target.name}")

        expect(current_path).to eq("/retailstores/#{target.id}/edit")
    end

    it 'retailstores edit a retailstores' do
        target = Retailstore.create!(name: "Targ",
            location: "Lone",
            total_items_in_stock: 4352,
            open_for_day: false)

        visit "/retailstores/#{target.id}/edit"

        fill_in('name', with: "Target")
        fill_in('location', with: "Lone Tree")
        fill_in('amount_in_stock', with: 4352)
        select(false, from: "open_for_day")

        click_button("Edit #{target.name}")

        expect(current_path).to eq("/retailstores/#{target.id}")
        expect(page).to have_content("Target")
        expect(page).to have_content("Lone Tree")
        expect(page).to have_content("4352")
        expect(page).to have_content("false")
    end

    it 'displays a link at the top of the page that says Items Index' do
        Item.destroy_all
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

        nike = target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        synergy = target.items.create!(brand: "Synergy",
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

        nike = target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        synergy = target.items.create!(brand: "Synergy",
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

        nike = target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        synergy = target.items.create!(brand: "Synergy",
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

        nike = target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        synergy = target.items.create!(brand: "Synergy",
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

        nike = target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        synergy = target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/retailstores/#{target.id}"


        click_link 'Items Index'

        expect(current_path).to eq("/items")
    end
end
