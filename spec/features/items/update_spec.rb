require 'rails_helper'

RSpec.describe "items update page", type: :feature do
   it 'can click on the link and see a form to fill in and edit the Item' do
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


        visit "/items/#{item_1.id}/edit"

        fill_in('Retailstore part name', with: "nike")
        fill_in('amount in stock of part', with: 40)
        fill_in('Need mechanic', with: true)

        click_button("Update This Item")

        expect(current_path).to eq("/items/#{item_1.id}")
        expect(page).to have_content("nike")
        expect(page).to have_content("40")
        expect(page).to have_content("true")
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
end
