util = require 'util'
EventEmitter = require 'events'.EventEmitter
Gearsize = require 'gear-size-calculator'
GearSizeRenderer = require './gear-size-renderer'
$ = require('jquery')(window)

Calculator = new Gearsize.Calculator

e = GearSizeUI.events = {
  showAll:            'show-all',
  showComparison:     'show-comparison',
  cassetteChanged:    'cassette-changed',
  rimDiameterChanged: 'rim-diameter-changed',
  tyreChanged:        'tyre-changed',
  chainRingsChanged:  'chain-rings-changed',
  error:              'error'
}
#https://github.com/alexyoung/nodeinpractice/tree/master/listings/web/browserify-2
#https://github.com/alexyoung/nodeinpractice/blob/master/listings/web/browserify-1/index.js
GearSizeUI = (options) ->
  @loaded = false
  @gearSizes = {}
  @rimDiameter = ''
  @cassette = ''
  @tyreSize = ''
  @chainRings = ''
  EventEmitter.call(this, options)
  #@on 'show-all', @messageReceived.bind(this)
  return

util.inherits(GearSizeUI, events.EventEmitter)

GearSizeUI = new GearSizeUI()

GearSizeUI.on(e.showAll, ->
  this.loaded = true
  GearSizeRenderer.loadControlValues()
  GearSizeRenderer.generateReferenceTable(this.gearSizes)
)

GearSizeUI.on(e.rimDiameterChanged, ->
  this.rimDiameter =
    $('#rim-diameter')
    .val()
    .parseInt(rimDiameter, 10)
)

GearSizeUI.on(e.cassetteChanged, ->
  this.cassette = (
    parseInt sprocket, 10 for sprocket in $('#cassette').val().split(',')
  )
)

GearSizeUI.on(e.tyreChanged, ->
  this.tyreSize =
    $('#tyre-size')
    .val()
    .parseInt(tyreSize, 10)
)

GearSizeUI.on(e.chainRingsChanged, ->
  this.chainRings =
    (parseInt ring, 10 for ring in $('#chainring').val().split(','))
)

GearSizeUI.on(e.calculateGearSizes, ->
  this.gearSizes = Calculator
    .generateGearSizesInInches(this.chainRings,
    this.cassette,
    this.rimDiameter,
    this.tyreSize
  )
)

GearSizeUI.on(e.error, (error) ->
  console.error('Error:', error)
  )



module exports GearSizeUI
