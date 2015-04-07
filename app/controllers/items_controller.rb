class ItemsController < ApplicationController
  # TODO: !!!! use csrf tokens !!!!
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    render json: { items: Item.all.to_a }
  end

  def create
    item = Item.new item_params
    if item.save
      render json: { items: Item.all.to_a }, status: :created
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
