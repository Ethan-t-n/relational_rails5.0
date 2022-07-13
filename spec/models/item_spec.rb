require 'rails_helper'

RSpec.describe Item, type: :model do
    describe "validations" do
        it { should validate_presence_of :brand }
        it { should validate_presence_of :amount_in_stock }
        it { should allow_value(true).for(:open_for_day) }
        it { should allow_value(false).for(:open_for_day) }
    end

    describe 'relationships' do
        it { should belong_to :retailstore }
    end
end
