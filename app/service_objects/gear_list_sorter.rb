module GearListSorter
  extend self

  def alphabetically(gear_list)
    gear_list.gear_list_items.sort do |a, b|
      a.item.name <=> b.item.name
    end
  end
end
