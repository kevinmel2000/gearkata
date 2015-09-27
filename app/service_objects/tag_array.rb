module TagArray
  extend self

  def for(tags)
    tags.sort { |a, b| a.name <=> b.name }.map do |tag| 
      [tag.name.capitalize, tag.name]
    end
  end
end
