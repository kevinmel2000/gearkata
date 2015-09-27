class window.ItemDragger

  constructor: ($, itemList, gearList) ->
    self = @

    # When dragged to this list, hide the quantity field and display the default number
    $(itemList).sortable(
      connectWith: $(gearList),
      receive: (event, ui) ->
        self.displayStaticField(ui.item)
    )

    # When dragged to this list, hide the default number and display the quantity field
    $(gearList).disableSelection()
    $(gearList).sortable(
      connectWith: $(itemList),
      update: (event, ui) ->
        self.populateSortOrder(gearList, ui)
      receive: (event, ui) ->
        self.displayDynamicField(ui.item)
    )

    # Double-clicking management
    $(gearList).on 'dblclick', '.item', ->
      $(this).appendTo itemList
      self.displayStaticField(this)

    $(itemList).on 'dblclick', '.item', ->
      $(this).appendTo gearList
      self.displayDynamicField(this)

    self

  # Figures out the numeric sort order of everything in the gear list
  populateSortOrder: (gearList, ui) ->
    order = []
    $(gearList + ' li').each (e) ->
      order.push $(this).attr('id') + '=' + ($(this).index() + 1)
      return
    positions = order.join(';')
    console.log(positions)

  # Turns on and off the display of the quantity fields in items
  displayStaticField: (item) ->
    $(item).find('.number-static').show()
    $(item).find('.number-fld').hide()

  displayDynamicField: (item) ->
    $(item).find('.number-static').hide()
    $(item).find('.number-fld').show()
