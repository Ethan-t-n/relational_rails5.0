class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to "/items/#{@item.id}"
    end

    def delete
        item = Item.find(params[:id])
        item.destroy
        redirect_to "/items"
     end

    private
    def item_params
        params.permit(:brand, :amount_in_stock, :availability)
    end
end
