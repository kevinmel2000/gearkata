class window.GearListDragger

  constructor: ($, gearList, expeditionList) ->
    self = @

    $(gearList).sortable(
      connectWith: $(expeditionList)
    )

    $(expeditionList).disableSelection()
    $(expeditionList).sortable(
      connectWith: $(gearList)
    )

    # Double-clicking management
    $(expeditionList).on 'dblclick', '.item', ->
      $(this).appendTo gearList

    $(gearList).on 'dblclick', '.item', ->
      $(this).appendTo expeditionList
