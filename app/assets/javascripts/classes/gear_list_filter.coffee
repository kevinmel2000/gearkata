class window.GearListFilter

  constructor: ($, listClass) ->
    self = @

    $('#name_selector').keyup (e) ->
      self.filterGearLists(listClass)

    self

  filterGearLists: (listClass) ->
    name = $('#name_selector').val()

    if !name
      $(listClass).find('li').show()
    else
      $(listClass).find('li').hide()

      name_str   = '[data-name*="' + name.toLowerCase() + '"]' if !!name
      filter_str = 'li' + name_str

      $(listClass).find(filter_str).show()
