class ItemDecorator < Draper::Decorator
  delegate_all

  def as_json(options = {})
    {
      id: id,
      name: name,
      tags: tag_string,
    }
  end

  private

  def tag_string
    %w|greenpoint pizza|.map { |t| "@#{t}" }.join(' ')
  end
end
