GearSizeUI = require './gear-size-events'
$ = require('jquery')(window)

GearSizeUI = new GearSizeUI()
events = GearSizeUI.events

#Trigger the initial start render event
$ ->
  GearSizeUI.emit(events.showAll)
  return

$("#rim-diameter").click(GearSizeUI.emit(events.rimDiameterChanged))
$("#tyre-size").click(GearSizeUI.emit(events.tyreChanged))
$("#chainring").click(GearSizeUI.emit(events.chainRingsChanged))
$('#cassette').click(GearSizeUI.emit(events.cassetteChanged))

$('#show-all').click(GearSizeUI.emit(events.showAll))
$('#show-comparison').click(GearSizeUI.emit(events.showComparison))
