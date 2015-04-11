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
    tags.map { |t| "@#{t.name}" }.join(' ')
  end
end
