module CategoryArray
  extend self

  def for(categories)
    categories.sort { |a, b| a.name <=> b.name }.map do |category|
      [category.name, category.id]
    end
  end
end
