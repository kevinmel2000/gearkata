$(document).ready ($) ->
  if $('body').hasClass('expeditions')
    gearListFilter = new GearListFilter($, '.gear-list-list')
    gearListDragger = new GearListDragger($, '.gear-list-list', '.expedition-list')

    # If we're on the Expeditions#show screen, disable dragging list items around
    if $('.expeditions').hasClass('show')
      $('.expedition-list').sortable( "disable" )
