require 'rails_helper'

describe Retailstore, type: :model do
    describe "validations" do
        it { should validate_presence_of :name}
        it { should validate_presence_of :location}
        it { should validate_presence_of :total_items_in_stock}
        it { should allow_value(true).for(:open_for_day) }
        it { should allow_value(false).for(:open_for_day) }
    end

    describe 'relationships' do
        it { should have_many :items}
    end

    describe 'model actions' do
      describe 'item_count' do
        it 'counts the number of items associated with the particular retailstores' do
            Item.destroy_all
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

            retailstores_3.items.create!(brand: "JBL",
                                   amount_in_stock: 500,
                                   availability: true)
            retailstores_3.items.create!(brand: "Hydro Flasks",
                                   amount_in_stock: 0,
                                   availability: false)

            expect(retailstores_1.item_count).to eq(2)
            expect(retailstores_2.item_count).to eq(2)
            expect(retailstores_3.item_count).to eq(2)
            end
        end

        describe 'self.sort_created_at do' do
            it 'sorts the class by most recently created first' do
                Retailstore.destroy_all

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

                expect(Retailstore.sort_created_at).to eq([retailstores_3, retailstores_2, retailstores_1])
                end
            end
        end

end
