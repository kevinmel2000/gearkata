$(document).ready ($) ->
  if $('body').hasClass('gear_lists')
    itemFilter = new ItemFilter($, '.item-list')
    itemDragger = new ItemDragger($, '.item-list', '.gear-list')

    # If we're on the GearLists#show screen, disable dragging list items around
    if $('.gear_lists').hasClass('show')
      $('.gear-list').sortable( "disable" )

      # Make it possible to check off list items
      $('.gear-list').on 'click', '.item', ->
        $(this).find('.checkbox').click()
