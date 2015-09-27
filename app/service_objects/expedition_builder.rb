module ExpeditionBuilder
  extend self

  def create(expedition, expedition_params, gear_lists_params)
    result = expedition.save

    if result
      delete_gear_lists(expedition, gear_lists_params)
      add_gear_lists(expedition, gear_lists_params)
    end

    result
  end

  def update(expedition, expedition_params, gear_lists_params)
    result = expedition.update_attributes(expedition_params)

    if result
      delete_gear_lists(expedition, gear_lists_params)
      add_gear_lists(expedition, gear_lists_params)
    end

    result
  end

  private

    def delete_gear_lists(expedition, gear_lists_params)
      gear_lists_params = sanitize_gear_lists_params(gear_lists_params)

      current_ids, new_ids = parse_gear_lists_ids(expedition, gear_lists_params)

      deleted_ids = current_ids.reject { |gear_list_id| new_ids.include?(gear_list_id) }

      deleted_ids.each do |gear_list_id|
        expedition_gear_list = expedition.expedition_gear_lists.find_by_gear_list_id(gear_list_id)
        expedition_gear_list.delete if expedition_gear_list
      end
    end

    def add_gear_lists(expedition, gear_lists_params)
      gear_lists_params = sanitize_gear_lists_params(gear_lists_params)

      current_ids, new_ids = parse_gear_lists_ids(expedition, gear_lists_params)

      added_ids   = new_ids.reject { |gear_list_id| current_ids.include?(gear_list_id) }
      updated_ids = new_ids.select { |gear_list_id| current_ids.include?(gear_list_id) }

      added_ids.each do |gear_list_id|
        expedition.expedition_gear_lists.create(gear_list_id: gear_list_id)
      end

      # TODO: I don't think we have to do anything for existing values, since they
      # just exist.
      #
      #updated_ids.each do |gear_list_id|
        #gear_list_item = gear_list.gear_list_items.find_by_item_id(item_id)
        #gear_list_item.update_attributes(quantity: items_params[item_id.to_s].to_i)
      #end
    end

    def sanitize_gear_lists_params(gear_lists_params)
      gear_lists_params.nil? ? {} : gear_lists_params
    end

    def parse_gear_lists_ids(expedition, gear_lists_params)
      current_ids = expedition.gear_lists.map(&:id)
      new_ids     = gear_lists_params.keys.map(&:to_i)

      return current_ids, new_ids
    end
end
