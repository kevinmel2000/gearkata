
#
$(document).ready ($) ->
  flashCallback = ->
    $('.flash-event').fadeOut()

  # Fades out flash messages after 7.5 seconds
  setTimeout flashCallback, 7500

  # Allows the user to click on the close X in a flash message to dismiss it
  $(document).on('click', '.close-x', ( ->
    $(this).closest('.flash-event').hide()
  ))
