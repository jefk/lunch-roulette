class ItemsController < ApplicationController
  def index
    render json: _data
  end

  private

  def _data
    {
      items: [
        {name: 'tie bomber', id: 45},
        {name: 'tie advanced', id: 43},
      ]
    }
  end
end
