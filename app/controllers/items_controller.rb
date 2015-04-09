class ItemsController < ApplicationController
  def index
    render json: { items: Item.all.decorate }
  end

  def create
    creation = ItemCreation.new item_params
    if creation.save
      render json: { items: Item.all.decorate }, status: :created
    else
      render json: { errors: creation.errors }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, tags: [])
  end
end
