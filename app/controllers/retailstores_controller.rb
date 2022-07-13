class RetailstoresController < ApplicationController
    def index
        @retailstores = Retailstore.sort_created_at
    end

    def show
        @retailstore = Retailstore.find(params[:id])
    end

    def new

    end

    def create
        retailstore = Retailstore.create(retailstore_params)
        redirect_to '/retailstores'
    end

    def edit
        @retailstore = Retailstore.find(params[:id])
    end

    def update
        retailstore = Retailstore.find(params[:id])
        retailstore.update(retailstore_params)
        redirect_to "/retailstores/#{retailstore.id}"
    end

    def delete
       items = Item.where(retailstore_id: "#{params[:id]}")
       retailstore = Retailstore.find(params[:id])
       items.destroy_all
       retailstore.destroy
       redirect_to "/retailstores"
    end

private
    def retailstore_params
        params.permit(:name, :location, :total_items_in_stock, :boolean)
    end
end
