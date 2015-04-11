class ItemFactory
  attr_reader :params

  def initialize(params)
    @params = params || {}
  end

  def run
    item.tags = tags
    item.save
  end

  private

  def tags
    params[:tags].map do |tag_name|
      Tag.where(name: tag_name.downcase).first_or_initialize
    end
  end

  def item
    @item ||= Item.where(name: params[:name]).first_or_initialize
  end
end
