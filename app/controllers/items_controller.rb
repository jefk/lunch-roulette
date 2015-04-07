class ItemsController < ApplicationController
  # TODO: !!!! use csrf tokens !!!!
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    render json: _data
  end

  def create
    render json: {}, status: :created
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
