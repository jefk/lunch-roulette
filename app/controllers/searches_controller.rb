class SearchesController < ApplicationController
  def create
    render json: { items: items.decorate }
  end

  private

  def items
    if tags.any?
      Item.joins(:tags).where('tags.name' => tags)
    else
      Item.all
    end
  end

  def tags
    params[:tags] || []
  end
end
