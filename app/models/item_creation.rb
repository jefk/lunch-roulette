class ItemCreation
  attr_reader :params

  def initialize(params)
    @params = params || {}
  end

  def save
    params[:tags].each do |tag_name|
      item.tags.where(name: tag_name).first_or_initialize
    end
    item.save
  end

  private

  def item
    @item ||= Item.where(name: params[:name]).first_or_initialize
  end
end
