# Filters the items in the list view based on tags and free-entry text
#
class window.ItemFilter

  constructor: ($, listClass) ->
    self = @

    $('#tag_selector').change ->
      self.filterItems(listClass)

    $('#name_selector').keyup (e) ->
      self.filterItems(listClass)

    self

  filterItems: (listClass) ->
    tags = $('#tag_selector :selected').text()
    name = $('#name_selector').val()

    if !tags && !name
      $(listClass).find('li').show()
    else
      $(listClass).find('li').hide()

      tag_str    = '[data-tags*="' + tags.toLowerCase() + '"]' if !!tags
      name_str   = '[data-name*="' + name.toLowerCase() + '"]' if !!name
      filter_str = 'li' + [tag_str, name_str].join('')

      $(listClass).find(filter_str).show()
