class Item < ApplicationRecord
    belongs_to :retailstore

    validates_presence_of :brand
    validates :availability, inclusion: [true, false]
    validates_presence_of :amount_in_stock
    # validates :amount_in_stock, :numericality => {:only_integer => true}
end
