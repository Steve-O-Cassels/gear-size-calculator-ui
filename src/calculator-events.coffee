util = require 'util'
events = require 'events'

# [Categorize event names using an object (1)](1)
# [Note on UI updates via event emitter(2)](2)
calculator = new GearSize.Calculator

GearSizes = {
  generateReferenceTable: ->
    #gearSizes = calculator.generateGearSizesInInches(chainRings, cassette, rimDiameter, tyreSize);

  loadControlValues: ->
    #$('#rim-diameter').add...
    #$('#tyre-size')
    #$('#chainring')
    #$('#cassette')

  renderTable: ->
}


GearSizeUI ->
  this.loaded = false
  this.gearSizes = {}
  events.EventEmitter.call this


util.inherits(GearSizeUI, events.EventEmitter)

GearSizeUI = new GearSizeUI()

GearSizeUI.on('first-load') ->
  this.loaded = true
  GearSizes.loadControlValues()
  this.gearSizes = GearSizes.generateReferenceTable
  GearSizes.renderTable(this.gearSizes)
  #call the calculator such that it calculates the reference table

  #xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  #Node.js in Practice (Kindle Locations 1494-1495).

Inheriting from EventEmitter



# create a namespace to export our public methods
GearSizeUIEvents = exports? and exports or @GearSizeUIEvents = {}

class GearSize.UIEvents
  renderGearSizes: renderGearSizes
  renderGearSizeReferenceTable: renderGearSizeReferenceTable
