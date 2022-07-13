require 'rails_helper'

RSpec.describe "items show page", type: :feature do
    it 'shows the child(item) matching the id in the path including its attributes' do
        retailstores_1 = Retailstore.create!(id: 1,
            name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)

        item_1 = Item.create!(brand: "nike",
                            amount_in_stock: 0,
                            availability: false,
                            retailstore_id: 1
                            )
        item_2 = Item.create!(brand: "Synergy",
                            amount_in_stock: 42,
                            availability: true,
                            retailstore_id: 1
                            )


        visit "/items/#{item_1.id}"

        expect(page).to have_content(item_1.brand)
        expect(page).to have_content("amount in stock of part: #{item_1.amount_in_stock}")
        expect(page).to have_content("Does it need a mechanic: #{item_1.availability}")
        expect(page).to_not have_content(item_2.brand)
    end

    it 'displays a link at the top of the page that says Items Index' do
        retailstores_1 = Retailstore.create!(id: 1,
            name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)

        item_1 = Item.create!(brand: "nike",
                            amount_in_stock: 0,
                            availability: false,
                            retailstore_id: 1
                            )
        item_2 = Item.create!(brand: "Synergy",
                            amount_in_stock: 42,
                            availability: true,
                            retailstore_id: 1
                            )


        visit "/items/#{item_1.id}"

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end

    it 'can click on the link and go to the Items Index' do
        retailstores_1 = Retailstore.create!(id: 1,
                            name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = Item.create!(brand: "nike",
                                    amount_in_stock: 0,
                                    availability: false,
                                    retailstore_id: 1
                                    )
        item_2 = Item.create!(brand: "Synergy",
                                    amount_in_stock: 42,
                                    availability: true,
                                    retailstore_id: 1
                                    )


        visit "/items/#{item_1.id}"

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end


    it 'displays a link at the top of the page that says Retailstore Index' do
        retailstores_1 = Retailstore.create!(id: 1,
            name: "Target",
            location: "Lone Tree",
            total_items_in_stock: 4352,
            open_for_day: true)

        item_1 = Item.create!(brand: "nike",
                            amount_in_stock: 0,
                            availability: false,
                            retailstore_id: 1
                            )
        item_2 = Item.create!(brand: "Synergy",
                            amount_in_stock: 42,
                            availability: true,
                            retailstore_id: 1
                            )


        visit "/items/#{item_1.id}"

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end

    it 'can click on the link and go to the Retailstore Index' do
        retailstores_1 = Retailstore.create!(id: 1,
                            name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = Item.create!(brand: "nike",
                                    amount_in_stock: 0,
                                    availability: false,
                                    retailstore_id: 1
                                    )
        item_2 = Item.create!(brand: "Synergy",
                                    amount_in_stock: 42,
                                    availability: true,
                                    retailstore_id: 1
                                    )


        visit "/items/#{item_1.id}"

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'displays a link on the page that says Update Item and will redirect to /items/:item_id/edit' do

        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false,
                                          retailstore_id: 1)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true,
                                           retailstore_id: 1)

        visit "/items/#{item_1.id}"

        within "#nav_links" do
            expect(page).to have_link("Update Item")
        end

        click_link 'Update Item'

        expect(current_path).to eq("/items/#{item_1.id}/edit")
    end

    it 'has a link to delete the item' do

        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false,
                                           retailstore_id: 1)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true,
                                           retailstore_id: 1)

        visit "/items/#{item_1.id}"

        within "#nav_links" do
            expect(page).to have_link("Delete Record Of This #{item_1.brand}")
        end
    end

    it 'has a link to delete the item' do

        retailstores_1 = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        item_1 = retailstores_1.items.create!(brand: "nike",
                                           amount_in_stock: 0,
                                           availability: false,
                                           retailstore_id: 1)
        item_2 = retailstores_1.items.create!(brand: "Synergy",
                                           amount_in_stock: 42,
                                           availability: true,
                                           retailstore_id: 1)

        visit "/items/#{item_1.id}"

        click_on "Delete Record Of This #{item_1.brand}"

        expect(current_path).to eq('/items')
        expect(page).to_not have_content("nike")
    end
end
