require 'rails_helper'

RSpec.describe "items index page", type: :feature do
    it 'can see the make name of each retailstores record in the system' do
        retailstores_1 = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
            location: "Highlands Ranch",
            total_items_in_stock: 0,
            open_for_day: false)

        visit "/retailstores"

        expect(page).to have_content(retailstores_1.name)
        expect(page).to have_content(retailstores_2.name)
    end

    it 'sorts the records in order by most recently created' do
        retailstores_1 = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
            location: "Highlands Ranch",
            total_items_in_stock: 0,
            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
            location: "Centennial",
            total_items_in_stock: 435,
            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
            location: "Littleton",
            total_items_in_stock: 0,
            open_for_day: false)

        visit '/retailstores'
        # expect(page.text.index#{@retailstores_4.name}).to be < page.text.index#{@retailstores_4.name})
        # save_and_open_page
        within "#retailstore-0" do
            expect(page).to have_content("Dillards")
        end

        within "#retailstore-1" do
            expect(page).to have_content("Costco")
        end

        within "#retailstore-2" do
            expect(page).to have_content("Walmart")
        end

        within "#retailstore-3" do
            expect(page).to have_content("Target")
        end
    end

    it 'shows when each of the records was created' do
        retailstores_1 = Retailstore.create!(name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
            location: "Highlands Ranch",
            total_items_in_stock: 0,
            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
            location: "Centennial",
            total_items_in_stock: 435,
            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
            location: "Littleton",
            total_items_in_stock: 0,
            open_for_day: false)

        visit '/retailstores'

        within "#retailstore-0" do
            expect(page).to have_content(retailstores_1.created_at)
        end

        within "#retailstore-1" do
            expect(page).to have_content(retailstores_2.created_at)
        end

        within "#retailstore-2" do
            expect(page).to have_content(retailstores_3.created_at)
        end

        within "#retailstore-3" do
            expect(page).to have_content(retailstores_4.created_at)
        end
    end

    it 'displays a link at the top of the page that says Items Index' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end

    it 'can click on the link and go to the Items Index' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end

    it 'displays a link at the top of the page that says Retailstore Index' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end

    it 'can click on the link and go to the Retailstore Index' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'has an edit link next to every parent' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        expect(page).to have_link("Click Here To Edit This #{retailstores_1.name}")
    end

    it 'after clicking edit next to parent, taken to parent edit page' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        click_link "Click Here To Edit This Target"

        expect(current_path).to eq("/retailstores/#{retailstores_1.id}/edit")
    end

    it 'has a delete link next to every parent' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        expect(page).to have_link("Click Here To Delete This #{retailstores_1.name}")
    end

    it 'after clicking delete next to parent, taken to parent index page' do
        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)
        retailstores_2 = Retailstore.create!(name: "Walmart",
                            location: "Highlands Ranch",
                            total_items_in_stock: 0,
                            open_for_day: false)
        retailstores_3 = Retailstore.create!(name: "Costco",
                            location: "Centennial",
                            total_items_in_stock: 435,
                            open_for_day: true)
        retailstores_4 = Retailstore.create!(name: "Dillards",
                            location: "Littleton",
                            total_items_in_stock: 0,
                            open_for_day: false)

        visit '/retailstores'

        click_link "Click Here To Delete This #{retailstores_1.name}"

        expect(current_path).to eq('/retailstores')
        expect(page).to_not have_content(retailstores_1.name)
    end


end
