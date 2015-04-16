class ItemsController < ApplicationController
  def create
    factory = ItemFactory.new item_params
    if factory.run
      render json: { items: Item.all.decorate }, status: :created
    else
      render json: { errors: factory.errors }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, tags: [])
  end
end
