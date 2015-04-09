class ItemsController < ApplicationController
  def index
    render json: { items: Item.all.decorate }
  end

  def create
    item = Item.new item_params
    if item.save
      render json: { items: Item.all.decorate }, status: :created
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
