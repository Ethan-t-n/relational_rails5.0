require 'rails_helper'

RSpec.describe "items index page", type: :feature do
    xit "can see all the items retailstores parts names, amount_in_stock, available" do
        #User story 15 overrides user story 3, thus this test being skipped

        target = Retailstore.create!(name: "Target",
                            location: "Lone Tree",
                            total_items_in_stock: 4352,
                            open_for_day: true)

        nike =  target.items.create!(brand: "nike",
                               amount_in_stock: 0,
                               availability: false)
        synergy  = target.items.create!(brand: "Synergy",
                               amount_in_stock: 42,
                               availability: true)

        visit "/items"

        expect(page).to have_content(nike.brand)
        expect(page).to have_content("amount in stock of #{nike.brand} is#{nike.amount_in_stock}")
        expect(page).to have_content("Availability? #{nike.availability}")
        expect(page).to have_content(synergy.brand)
        expect(page).to have_content("amount in stock of #{synergy.brand} is#{synergy.amount_in_stock}")
        expect(page).to have_content("Availability? #{synergy.availability}")
    end

    it 'displays a link at the top of the page that says Items Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)


        visit "/items"

        within "#nav_links" do
            expect(page).to have_content("Items Index")
        end
    end

    it 'can click on the link and go to the Items Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)


        visit "/items"

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end

    it 'displays a link at the top of the page that says Retailstore Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)


        visit "/items"

        within "#nav_links" do
            expect(page).to have_content("Retailstore Index")
        end
    end

    it 'can click on the link and go to the Retailstore Index' do
      target = Retailstore.create!(name: "Target",
                          location: "Lone Tree",
                          total_items_in_stock: 4352,
                          open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                             amount_in_stock: 0,
                             availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                             amount_in_stock: 42,
                             availability: true)


        visit "/items"

        click_link 'Retailstore Index'

        expect(current_path).to eq('/retailstores')
    end

    it 'shows only true records on the child index page' do
    #User Story 15 overrides User Story 3

        target = Retailstore.create!(name: "Target",
                        location: "Lone Tree",
                        total_items_in_stock: 4352,
                        open_for_day: true)

        nike =  target.items.create!(brand: "nike",
                           amount_in_stock: 0,
                           availability: false)
        synergy  = target.items.create!(brand: "Synergy",
                           amount_in_stock: 42,
                           availability: true)

        kirkland = target.items.create!(brand: "Kirkland",
                                           amount_in_stock: 32,
                                           availability: false)
        nintendo = target.items.create!(brand: "Nintendo",
                                           amount_in_stock: 12,
                                           availability: true)

        visit '/items'

        # expect(page).to have_content("Synergy")
        expect(page).to have_content("42")
        expect(page).to have_content("Nintendo")
        expect(page).to have_content("12")

        expect(page).to_not have_content("nike")
        expect(page).to_not have_content("Kirkland")
    end

    it 'has an edit link next to every item' do
       target = Retailstore.create!(name: "Target",
                      location: "Lone Tree",
                      total_items_in_stock: 4352,
                      open_for_day: true)

       nike =  target.items.create!(brand: "nike",
                         amount_in_stock: 0,
                         availability: false)
       synergy  = target.items.create!(brand: "Synergy",
                         amount_in_stock: 42,
                         availability: true)

       kirkland = target.items.create!(brand: "Kirkland",
                                         amount_in_stock: 32,
                                         availability: false)
       nintendo = target.items.create!(brand: "Nintendo",
                                         amount_in_stock: 12,
                                         availability: true)

        visit '/items'

        expect(page).to have_link("Click Here To Edit This #{synergy.brand}")
        expect(page).to have_link("Click Here To Edit This #{nintendo.brand}")
    end

    it 'after clicking edit next to parent, taken to parent edit page' do
      target = Retailstore.create!(name: "Target",
                      location: "Lone Tree",
                      total_items_in_stock: 4352,
                      open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                         amount_in_stock: 0,
                         availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                         amount_in_stock: 42,
                         availability: true)

      kirkland = target.items.create!(brand: "Kirkland",
                                         amount_in_stock: 32,
                                         availability: false)
      nintendo = target.items.create!(brand: "Nintendo",
                                         amount_in_stock: 12,
                                         availability: true)

        visit '/items'

        click_link "Click Here To Edit This Synergy"

        expect(current_path).to eq("/items/#{synergy.id}/edit")
    end

    it 'has an delete link next to every item' do
      target = Retailstore.create!(name: "Target",
                      location: "Lone Tree",
                      total_items_in_stock: 4352,
                      open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                         amount_in_stock: 0,
                         availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                         amount_in_stock: 42,
                         availability: true)

      kirkland = target.items.create!(brand: "Kirkland",
                                         amount_in_stock: 32,
                                         availability: false)
      nintendo = target.items.create!(brand: "Nintendo",
                                         amount_in_stock: 12,
                                         availability: true)

        visit '/items'

        expect(page).to have_link("Click Here To Delete This #{synergy.brand}")
    end

    it 'after clicking delete next to item, taken to item index page' do
      target = Retailstore.create!(name: "Target",
                      location: "Lone Tree",
                      total_items_in_stock: 4352,
                      open_for_day: true)

      nike =  target.items.create!(brand: "nike",
                         amount_in_stock: 0,
                         availability: false)
      synergy  = target.items.create!(brand: "Synergy",
                         amount_in_stock: 42,
                         availability: true)

      kirkland = target.items.create!(brand: "Kirkland",
                                         amount_in_stock: 32,
                                         availability: false)
      nintendo = target.items.create!(brand: "Nintendo",
                                         amount_in_stock: 12,
                                         availability: true)

        visit '/items'

        click_link "Click Here To Delete This Synergy"

        expect(current_path).to eq("/items")
        expect(page).to_not have_content("Synergy")
    end
end
