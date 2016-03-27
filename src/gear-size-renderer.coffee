Settings = require './settings'
$ = require('jquery')(window)

GearSizeRenderer = {
  generateReferenceTable: ->

  loadControlValues: ->
    renderDropDownOptions Settings.cassettes, '#cassettes'
    renderDropDownOptions Settings.rims, '#rim-diameters'
    renderDropDownOptions Settings.tyres, '#tyre-sizes'
    renderDropDownOptions Settings.chainrings, '#chainrings'

  renderDropDownOptions: (items, dropDownId) ->
    i = 0
    while i < items.length
      jQuery('<option/>', {
      value: items[i],
      html: items[i]
      }).appendTo(dropDownId)

  renderTable: ->
    template = $('#gear-size')
    i = 0
    while i < gearSizes.length
      data = gearSizes[i]
      if i == 0
        clone = template.content.cloneNode(true)
        headingRow = clone.querySelectorAll('td')
        x = 0
        while x < data.length
          headingRow[x + 1].textContent = data[x].sprocket
          x += 1
        template.parentNode.appendChild clone
      clone = template.content.cloneNode(true)
      sizeRow = clone.querySelectorAll('td')
      sizeRow[0].textContent = data[0].chainRing
      y = 0
      while y < data.length
        sizeRow[y + 1].textContent = data[y].gearSize
        sizeRow[y + 1].title = data[y].toString()
        y += 1
      template.parentNode.appendChild clone
      i += 1
    return
}

# create a namespace to export our public methods
GearSizeRenderer = exports? and exports or @GearSizeRenderer = {}
