class SearchesController < ApplicationController
  def create
    render json: { items: Item.all.decorate }
  end

  private

  def item_params
    params.require(:search).permit(tags: [])
  end
end
