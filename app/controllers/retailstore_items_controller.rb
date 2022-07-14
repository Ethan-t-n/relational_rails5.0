class RetailstoreItemsController < ApplicationController
    def index
        @retailstore = Retailstore.find(params[:retailstore_id])
        if params[:sort] == "activated"
            @items = @retailstore.items.order('brand')
        elsif params[:minimum]
            # threshold_input = params[:minimum]
            # integer = threshold_input.to_i
            @items = @retailstore.items.minimum(params[:minimum])
        else
            @items = @retailstore.items
        end
    end

    def new
        @retailstore = Retailstore.find(params[:retailstore_id])
    end

    def create
        @retailstore = Retailstore.find(params[:retailstore_id])
        @retailstore.items.create(item_params)
        redirect_to "/retailstores/#{@retailstore.id}/items"
    end

    private
    def item_params
        params.permit(:brand, :amount_in_stock, :availability, :retailstore_id)
    end
end
