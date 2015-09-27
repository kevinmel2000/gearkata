module GearListBuilder
  extend self

  def create(gear_list, gear_list_params, items_params)
    result = gear_list.save

    if result
      # TODO: I don't like this approach. These two calls are
      # side-effects; if they fail, then programmatically no one will ever know
      delete_items(gear_list, items_params)
      add_items(gear_list, items_params)
    end

    result
  end

  def update(gear_list, gear_list_params, items_params)
    result = gear_list.update_attributes(gear_list_params)

    if result
      delete_items(gear_list, items_params)
      add_items(gear_list, items_params)
    end

    result
  end

  private

    def delete_items(gear_list, items_params)
      items_params = sanitize_items_params(items_params)

      current_ids, new_ids = parse_item_ids(gear_list, items_params)

      deleted_ids = current_ids.reject { |item_id| new_ids.include?(item_id) }

      deleted_ids.each do |item_id|
        gear_list_item = gear_list.gear_list_items.find_by_item_id(item_id)
        gear_list_item.delete if gear_list_item
      end
    end

    def add_items(gear_list, items_params)
      items_params = sanitize_items_params(items_params)

      current_ids, new_ids = parse_item_ids(gear_list, items_params)

      added_ids   = new_ids.reject { |item_id| current_ids.include?(item_id) }
      updated_ids = new_ids.select { |item_id| current_ids.include?(item_id) }

      added_ids.each do |item_id|
        gear_list.gear_list_items.create(item_id: item_id, quantity: items_params[item_id.to_s].to_i)
      end

      updated_ids.each do |item_id|
        gear_list_item = gear_list.gear_list_items.find_by_item_id(item_id)
        gear_list_item.update_attributes(quantity: items_params[item_id.to_s].to_i)
      end
    end

    def sanitize_items_params(items_params)
      items_params.nil? ? {} : items_params
    end

    def parse_item_ids(gear_list, items_params)
      current_ids = gear_list.items.map(&:id)
      new_ids     = items_params.keys.map(&:to_i)

      return current_ids, new_ids
    end
end
