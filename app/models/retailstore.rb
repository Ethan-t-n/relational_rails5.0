class Retailstore < ApplicationRecord
    has_many :items

    validates_presence_of :name
    validates_presence_of :location
    validates_presence_of :total_items_in_stock
    validates :open_for_day, inclusion: [true, false]

    def item_count
        items.count
    end

    def self.sort_created_at
        order(created_at: :desc)
    end
end
